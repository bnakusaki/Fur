import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/presentation/bloc/animals_mixin.dart';
import 'package:fur/core/pet/presentation/interface/screens/select_pet_breed_screen.dart';
import 'package:fur/core/animals/presentation/providers/list_animals.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:fur/shared/widgets/image_and_label.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

class SelectPetSpeciesScreen extends HookConsumerWidget with AnimalMixin {
  SelectPetSpeciesScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final magnifierCancelAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final searchFieldController = useTextEditingController();
    final searchFieldFocusNode = useFocusNode();

    final searchTerm = useState('');
    final selectedAnimal = useState<Animal?>(null);

    final animals = ref.watch(listAnimalsProvider(Localizations.localeOf(context).languageCode));

    final randInt = useState(Random().nextInt(sadPets.length));

    void handleContinue() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SelectPetBreedScreen(
              animal: selectedAnimal.value!,
              pet: pet.copyWith(animal: selectedAnimal.value!.id),
            );
          },
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AppBackButton(),
            ),
          ]),
          title: Text(
            localizations.appPageTitlesBasicInformation,
            style: textStyles.h2,
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                localizations.appQuestionsSelectPetSpecies(pet.name.capitalize()),
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                controller: searchFieldController,
                focusNode: searchFieldFocusNode,
                hintText: localizations.appTextFieldHintsSearch,
                onChanged: (value) {
                  if (value!.trim().isEmpty) {
                    magnifierCancelAnimationController.reverse();
                  } else {
                    magnifierCancelAnimationController.forward();
                  }
                  searchTerm.value = value;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchTerm.value.isNotEmpty) {
                      magnifierCancelAnimationController.reverse();
                      searchTerm.value = '';
                      searchFieldController.clear();
                    } else {
                      searchFieldFocusNode.requestFocus();
                    }
                  },
                  icon: LottieBuilder.asset(
                    frameRate: FrameRate.max,
                    controller: magnifierCancelAnimationController,
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
