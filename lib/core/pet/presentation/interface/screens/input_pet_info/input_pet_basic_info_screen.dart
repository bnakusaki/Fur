// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_info/select_pet_breed_screen.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_info/select_pet_species_screen.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';

class InputPetBasicInfoScreen extends HookConsumerWidget with PetsMixin {
  InputPetBasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final nameController = useTextEditingController();
    final image = useState<XFile?>(null);

    final weigthController = useTextEditingController();
    final species = useState<Species?>(null);
    final breed = useState<Breed?>(null);
    final dob = useState<DateTime?>(null);

    Future<void> handleDone() async {
      if (formKey.currentState!.validate()) {
        if (species.value == null) {
          AppSnackBar.warning(context, localizations.appValidationMessagesPetSpecies);
          return;
        } else if (breed.value == null) {
          AppSnackBar.warning(context, localizations.appValidationMessagesPetBreed);
          return;
        } else if (dob.value == null) {
          AppSnackBar.warning(context, localizations.appValidationMessagesPetDob);
          return;
        }

        final pet = Pet.empty().copyWith(
          name: nameController.text,
          species: species.value!.id,
          breed: breed.value!.id,
          weight: {DateTime.now(): double.parse(weigthController.text)},
          dob: dob.value!,
          owner: FirebaseAuth.instance.currentUser!.uid,
        );

        try {
          final petId = (await createPet(pet)).id;
          final imageUrl = await savePetImage(petId, File(image.value!.path));

          ref.watch(cachedPetsProvider).add(pet.copyWith(image: imageUrl));

          if (context.mounted) {
            Navigator.pop(context);
          }
        } on Failure catch (e) {
          if (context.mounted) {
            AppSnackBar.error(context, e.code);
          }
        }
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const BackButton(),
          title: Text(localizations.appPageTitlesBasicInformation),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    localizations.petName,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    controller: nameController,
                    hintText: localizations.appTextFieldHintsPetName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return localizations.appValidationMessagesPetName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pet image',
                        style: theme.textTheme.titleMedium,
                      ),
                      image.value == null
                          ? _AddPetImageButton(image: image, theme: theme)
                          : _RemovePetImageButton(image: image, theme: theme),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (image.value != null) _PetImageCard(image: File(image.value!.path)),
                  const SizedBox(height: 20),
                  Text(
                    localizations.species,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectPetspeciesScreen(
                            onSelect: (value) {
                              if (value != species.value) {
                                species.value = value;
                                breed.value = null;
                              }

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                    title: Text(species.value?.name ?? localizations.selectSpecies),
                    trailing: SvgPicture.asset(AppIcons.angleSmallRight),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.breed,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () {
                      if (species.value == null) {
                        AppSnackBar.info(
                          context,
                          localizations.appValidationMessagesSelectSpeciesBeforeBreed,
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectPetBreedScreen(
                            onSelect: (value) {
                              breed.value = value;
                              Navigator.pop(context);
                            },
                            speciesId: species.value!.id,
                          ),
                        ),
                      );
                    },
                    title: Text(breed.value?.name ?? localizations.selectBreed),
                    trailing: SvgPicture.asset(AppIcons.angleSmallRight),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.weightInKilograms,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    controller: weigthController,
                    hintText: localizations.appTextFieldHintsEnterWeight,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return localizations.appValidationMessagesPetWeight;
                      } else if (value.split('.').length > 2) {
                        return localizations.appValidationMessagesInvalidPetWeight;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.birthDate,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () async {
                      final value = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );

                      if (value != null) {
                        dob.value = value;
                      }
                    },
                    title: dob.value == null
                        ? Text(localizations.pickDate)
                        : Text(DateFormat('MMMM dd, yyyy').format(dob.value!)),
                    trailing: SvgPicture.asset(AppIcons.calendarPlus),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 20,
            right: 20,
          ),
          child: const ElevatedButton(
            onPressed: null,
            child: Text('Done'),
          ).withLoadingState(onPressed: handleDone),
        ),
      ),
    );
  }
}

class _PetImageCard extends HookWidget {
  const _PetImageCard({required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    final analyzingImage = useState(false);
    final analysis = useState<Map<String, String>?>(null);

    Future<Map<String, String>> analyzeImage(File image) async {
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
      return {
        'species': json['species'] ?? 'unknown',
        'breed': json['breed'] ?? 'unknown',
        'color': json['color'] ?? 'unknown',
      };
    }

    useMemoized(
      () async {
        try {
          analyzingImage.value = true;
          analysis.value = await analyzeImage(image);
        } catch (e) {
          if (kDebugMode) Logger().e(e);
        } finally {
          analyzingImage.value = false;
        }
      },
    );

    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Card(
              margin: EdgeInsets.zero,
              child: Image.file(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (analyzingImage.value)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          if (analyzingImage.value)
            const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: LoadingIndicator(
                  indicatorType: Indicator.circleStrokeSpin,
                  colors: [Colors.white],
                ),
              ),
            ),
          if (analysis.value != null && analysis.value!.isNotEmpty && !analyzingImage.value)
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Builder(builder: (context) {
                      // remove unknown values from the analysis
                      analysis.value!.removeWhere((key, value) => value == 'unknown');

                      analysis.value = analysis.value;

                      String text = '';

                      if (analysis.value!.isEmpty) {
                        text = 'Not a pet';
                      }

                      if (analysis.value!['species'] != null) {
                        text = analysis.value!['species'].toString().capitalize();
                      }

                      if (analysis.value!['breed'] != null) {
                        text += '\n${analysis.value!['breed'].toString().capitalize()}';
                      }

                      if (analysis.value!['color'] != null) {
                        text += '\n${analysis.value!['color'].toString().capitalize()}';
                      }

                      return Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.end,
                      );
                    }),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _AddPetImageButton extends StatelessWidget {
  const _AddPetImageButton({
    required this.image,
    required this.theme,
  });

  final ValueNotifier<XFile?> image;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Material(
                color: Colors.transparent,
                child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick image from',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        TextButton.icon(
                          onPressed: () async {
                            image.value =
                                await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                          icon: SvgPicture.asset(
                            AppIcons.gallery,
                            color: theme.primaryColor,
                          ),
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromWidth(double.maxFinite),
                            alignment: Alignment.centerLeft,
                          ),
                          label: const Text('Gallery'),
                        ),
                        TextButton.icon(
                          onPressed: () async {
                            image.value = await ImagePicker().pickImage(source: ImageSource.camera);
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                          icon: SvgPicture.asset(
                            AppIcons.camera,
                            color: theme.primaryColor,
                          ),
                          style: TextButton.styleFrom(
                            fixedSize: const Size.fromWidth(double.maxFinite),
                            alignment: Alignment.centerLeft,
                          ),
                          label: const Text('Camera'),
                        ),
                      ],
                    )),
              ),
            );
          },
        );
      },
      child: Text(
        'Add',
        style: TextStyle(
          color: theme.primaryColor,
        ),
      ),
    );
  }
}

class _RemovePetImageButton extends StatelessWidget {
  const _RemovePetImageButton({
    required this.image,
    required this.theme,
  });

  final ValueNotifier<XFile?> image;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        image.value = null;
      },
      child: Text(
        'Remove',
        style: TextStyle(
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
