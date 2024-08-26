import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/progress_bar.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/sections/add_pet_picture.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/sections/input_pet_name.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/sections/save_pet_profile.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/sections/select_pet_birth_date.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/sections/select_pet_breed.dart';
import 'package:fur/core/pet/presentation/interface/widgets/add_pet/sections/select_pet_sex.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class AddPetScreen extends HookConsumerWidget {
  const AddPetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final image = useState<XFile?>(null);
    final progressCounter = useState(0);
    final selectedBreed = useState<PetBreed?>(null);
    final petNameController = useTextEditingController();
    final selectedSex = useState<PetGender?>(null);
    final imageAnalysisResult = useState<PetImageAnalysisResult?>(null);
    final birthDate = useState<DateTime>(DateTime.now());

    Future<PetImageAnalysisResult> analyzeImage(File image) async {
      final unit8ListImage = await image.readAsBytes();

      final analysisResult = await Gemini.instance.textAndImage(
        text: '''
              Analyze the image and provide the following information about the animal:
              {
                "species": "<species>",
                "breed": "<breed>",
                "color": "<color>"
              }
              If any of the information is unknown, use "unknown". If the image is not a pet, return {}.
              ''',
        images: [unit8ListImage],
      );

      final json = jsonDecode(analysisResult?.content?.parts?[0].text ?? '{}');
      Logger().d(json);
      return PetImageAnalysisResult(
        species: json['species'] ?? 'unknown',
        breed: json['breed'] ?? 'unknown',
        color: json['color'] ?? 'unknown',
      );
    }

    useMemoized(
      () async {
        imageAnalysisResult.value = null;
        if (image.value == null) return;
        imageAnalysisResult.value = await analyzeImage(File(image.value!.path));
      },
      [image.value],
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: progressCounter.value != 5
              ? BackButton(
                  onPressed: () {
                    if (progressCounter.value > 0) {
                      progressCounter.value -= 1;
                    } else {
                      Navigator.pop(context);
                    }
                  },
                )
              : null,
          backgroundColor: Colors.white30,
          title: const Text('Add pet'),
          bottom: PreferredSize(
            preferredSize: const Size(double.maxFinite, 5),
            child: ProgressBar(progressCounter: progressCounter),
          ),
        ),
        extendBody: progressCounter.value == 0 ? true : false,
        extendBodyBehindAppBar: progressCounter.value == 0 ? true : false,

        ///
        body: switch (progressCounter.value) {
          0 => AddPetPicture(
              image: image,
              progressCounter: progressCounter,
            ),
          1 => InputPetName(
              image: image,
              theme: theme,
              petNameController: petNameController,
            ),
          2 => SelectPetBreed(
              theme: theme,
              textStyles: textStyles,
              selectedBreed: selectedBreed,
              imageAnalysis: imageAnalysisResult.value,
            ),
          3 => SelectPetSex(
              image: image,
              petNameController: petNameController,
              theme: theme,
              selectedSex: selectedSex,
            ),
          4 => SelectPetBirthDate(
              petNameController: petNameController,
              theme: theme,
              birthDate: birthDate,
            ),
          5 => SavePetProfile(
              pet: Pet.empty().copyWith(
                name: petNameController.text,
                breed: selectedBreed.value!.id,
                dob: birthDate.value,
                gender: selectedSex.value!,
              ),
              image: File(image.value!.path),
            ),
          _ => const SizedBox.shrink(),
        },

        ///
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: AppSizes.screenHorizontalPadding,
              right: AppSizes.screenHorizontalPadding,
              bottom: MediaQuery.paddingOf(context).bottom + 10,
            ),
            child: switch (progressCounter.value) {
              1 => ListenableBuilder(
                  listenable: petNameController,
                  builder: (context, child) {
                    if (petNameController.text.isNotEmpty) {
                      return ElevatedButton(
                        onPressed: () {
                          progressCounter.value += 1;
                        },
                        child: const Text('Continue'),
                      ).animate().fadeIn().slideY(begin: 0.1);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              2 => selectedBreed.value != null
                  ? ElevatedButton(
                      onPressed: () {
                        progressCounter.value += 1;
                      },
                      child: const Text('Continue'),
                    ).animate().fadeIn().slideY(begin: 0.1)
                  : null,
              3 => selectedSex.value != null
                  ? ElevatedButton(
                      onPressed: () {
                        progressCounter.value += 1;
                      },
                      child: const Text('Continue'),
                    ).animate().fadeIn().slideY(begin: 0.1)
                  : null,
              4 => ElevatedButton(
                  onPressed: () {
                    progressCounter.value += 1;
                  },
                  child: const Text('Continue'),
                ).animate().fadeIn().slideY(begin: 0.1),
              _ => const SizedBox.shrink(),
            }),
      ),
    );
  }
}

class PetImageAnalysisResult {
  final String species;
  final String breed;
  final String color;

  PetImageAnalysisResult({
    required this.species,
    required this.breed,
    required this.color,
  });
}
