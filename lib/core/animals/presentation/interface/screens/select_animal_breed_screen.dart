import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/presentation/bloc/animals_mixin.dart';
import 'package:fur/core/animals/presentation/providers/list_breeds.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/image_and_label.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

class SelectAnimalBreedScreen extends HookConsumerWidget with AnimalMixin {
  SelectAnimalBreedScreen({
    super.key,
    required this.animal,
  });

  final Animal animal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchController = useTextEditingController();

    final searchTerm = useState('');

    final breeds =
        ref.watch(listBreedsProvider(Localizations.localeOf(context).languageCode, animal.id));

    final randInt = useState(Random().nextInt(sadPets.length));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBackButton(),
          centerTitle: false,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                localizations.whatBreedIsYourPet(animal.name),
                style: textStyles.h2,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                controller: searchController,
                hintText: localizations.searchBreed(animal.name),
                onChanged: (value) {
                  if (value!.trim().isEmpty) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      searchController.clear();
                      animationController.reverse();
                    } else {
                      // TODO: implement search
                    }
                  },
                  icon: LottieBuilder.asset(
                    frameRate: FrameRate.max,
                    controller: animationController,
                    AppAnimatedIcons.searchToX,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: switch (breeds) {
                  AsyncData(:final value) => Builder(builder: (context) {
                      late List<Breed> filteredBreeds;
                      if (searchTerm.value.isEmpty) {
                        filteredBreeds = value;
                      } else {
                        filteredBreeds = value.where((animal) {
                          return animal.name.toLowerCase().contains(searchTerm.value.toLowerCase());
                        }).toList();
                      }

                      return filteredBreeds.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    height: MediaQuery.of(context).size.width * 0.6,
                                    child: Card(
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 4,
                                        ),
                                      ),
                                      child: Image.asset(
                                        sadPets[randInt.value],
                                        fit: BoxFit.cover,
                                      ).animate().fadeIn(),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    localizations.noPetsFound,
                                    style: textStyles.emptyState,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 120),
                                ],
                              ),
                            )
                          : Scrollbar(
                              child: ListView.separated(
                                itemBuilder: (context, index) {
                                  late List<Breed> row;
                                  try {
                                    row = filteredBreeds.sublist(index * 2, (index * 2) + 2);
                                  } catch (e) {
                                    row = [filteredBreeds[index * 2], Breed.empty()];
                                  }

                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: row
                                        .map((breed) => Expanded(
                                              child: breed == Breed.empty()
                                                  ? const SizedBox()
                                                  : ImageAndLabel(
                                                      imageUrl: breed.imageUrl,
                                                      label: breed.name,
                                                      onTap: () {},
                                                    ),
                                            ))
                                        .toList(),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 10);
                                },
                                itemCount: (filteredBreeds.length / 2).ceil(),
                              ),
                            );
                    }),
                  AsyncError(:final error) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.width * 0.6,
                            child: Card(
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 4,
                                ),
                              ),
                              child: Image.asset(
                                sadPets[randInt.value],
                                fit: BoxFit.cover,
                              ).animate().fadeIn(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            error.toString(),
                            style: textStyles.emptyState,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 120),
                        ],
                      ),
                    ),
                  _ => const Center(
                      child: SizedBox(
                        height: 30,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballGridPulse,
                        ),
                      ),
                    ),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
