import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/presentation/bloc/animals_mixin.dart';
import 'package:fur/core/animals/presentation/interface/screens/select_animal_breed_screen.dart';
import 'package:fur/core/animals/presentation/providers/list_animals.dart';
import 'package:fur/core/pet/presentation/providers/add_pet_form_notifier.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:fur/shared/widgets/image_and_label.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

class SelectAnimalScreen extends HookConsumerWidget with AnimalMixin {
  SelectAnimalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchController = useTextEditingController();
    final searchFieldFocusNode = useFocusNode();

    final searchTerm = useState('');
    final selectedAnimal = useState<Animal?>(null);

    final animals = ref.watch(listAnimalsProvider(Localizations.localeOf(context).languageCode));

    final randInt = useState(Random().nextInt(sadPets.length));

    final addPetForm = ref.watch(addPetFormNotifierProvider);

    void handleContinue() {
      ref.watch(addPetFormNotifierProvider.notifier).update(
            (pet) => pet.copyWith(animal: selectedAnimal.value!.id),
          );

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SelectAnimalBreedScreen(
          animal: selectedAnimal.value!,
        );
      }));
    }

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
                localizations.selectAnimalQuestion(addPetForm.name.capitalize()),
                style: textStyles.h2,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                controller: searchController,
                focusNode: searchFieldFocusNode,
                hintText: localizations.appTextFieldHintsSearchPets,
                onChanged: (value) {
                  if (value!.trim().isEmpty) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                  searchTerm.value = value;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchTerm.value.isNotEmpty) {
                      animationController.reverse();
                      searchTerm.value = '';
                      searchController.clear();
                    } else {
                      searchFieldFocusNode.requestFocus();
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
                child: switch (animals) {
                  AsyncData(:final value) => Builder(
                      builder: (context) {
                        late List<Animal> filteredAnimals;
                        if (searchTerm.value.isEmpty) {
                          filteredAnimals = value;
                        } else {
                          filteredAnimals = value.where((animal) {
                            return animal.name
                                .toLowerCase()
                                .contains(searchTerm.value.toLowerCase());
                          }).toList();
                        }

                        return filteredAnimals.isEmpty
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
                                    late List<Animal> row;
                                    try {
                                      row = filteredAnimals.sublist(index * 2, (index * 2) + 2);
                                    } catch (e) {
                                      row = [filteredAnimals[index * 2], Animal.empty()];
                                    }
                                    return Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: row
                                          .map((animal) => Expanded(
                                                child: animal == Animal.empty()
                                                    ? const SizedBox()
                                                    : ImageAndLabel(
                                                        imageUrl: animal.imageUrl,
                                                        label: animal.name,
                                                        selected: selectedAnimal.value == animal,
                                                        onTap: () {
                                                          selectedAnimal.value = animal;
                                                        },
                                                      ),
                                              ))
                                          .toList(),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(height: 10);
                                  },
                                  itemCount: (filteredAnimals.length / 2).ceil(),
                                ),
                              );
                      },
                    ),
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
        bottomNavigationBar: selectedAnimal.value != null
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom + 20,
                  left: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: handleContinue,
                  child: Text(localizations.appButtonsContinue),
                ).animate().fadeIn().slideY(begin: 0.1),
              )
            : null,
      ),
    );
  }
}
