import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/presentation/bloc/animals_mixin.dart';
import 'package:fur/core/animals/presentation/interface/screens/save_pet_screen.dart';
import 'package:fur/core/animals/presentation/providers/list_breeds.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/providers/add_pet_form_notifier.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

class SelectPetBreedScreen extends HookConsumerWidget with AnimalMixin {
  SelectPetBreedScreen({
    super.key,
    required this.animal,
    required this.pet,
  });

  final Animal animal;
  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final textStyles = Theme.of(context).extension<TextStyles>()!;
    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchController = useTextEditingController();
    final scrollController = useScrollController();
    final breedsCache = useState<List<Breed>>([]);
    final fetchingMore = useState(false);
    final searchTerm = useState('');
    final allDataFetched = useState(false);
    final selectedBreed = useState<Breed?>(null);

    useEffect(() {
      if (allDataFetched.value) return null;
      listener() async {
        if (scrollController.position.extentAfter < 200 && !fetchingMore.value) {
          try {
            fetchingMore.value = true;
            final chunk = await ref.watch(listBreedsProvider(
              Localizations.localeOf(context).languageCode,
              animal.id,
              breedsCache.value.lastOrNull,
            ).future);

            if (chunk.isNotEmpty) {
              breedsCache.value = [...breedsCache.value, ...chunk];
            } else {
              allDataFetched.value = true;
            }
          } catch (e) {
            Logger().e(e);
          } finally {
            fetchingMore.value = false;
          }
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController, fetchingMore, breedsCache]);

    final breeds = ref
        .watch(listBreedsProvider(Localizations.localeOf(context).languageCode, animal.id, null));

    breeds.whenData((value) {
      if (breedsCache.value.isEmpty) {
        breedsCache.value = value;
      }
    });

    final randInt = useState(Random().nextInt(sadPets.length));

    void handleContinue() {
      ref
          .watch(addPetFormNotifierProvider.notifier)
          .update((pet) => pet.copyWith(breed: selectedBreed.value!.id));

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => SavePetScreen(),
        ),
        (route) => true,
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const Row(children: [
            AppBackButton(),
          ]),
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
                  searchTerm.value = value.trim();
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      searchController.clear();
                      animationController.reverse();
                      searchTerm.value = '';
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
                  AsyncData() => ValueListenableBuilder<List<Breed>>(
                      valueListenable: breedsCache,
                      builder: (context, breeds, child) {
                        final filteredBreeds = searchTerm.value.isEmpty
                            ? breeds
                            : breeds
                                .where((animal) => animal.name
                                    .toLowerCase()
                                    .contains(searchTerm.value.toLowerCase()))
                                .toList();

                        if (filteredBreeds.isEmpty) {
                          return _EmptyState(
                            sadPets: sadPets,
                            localizations: localizations,
                            imageIndex: randInt.value,
                            textStyles: textStyles,
                          );
                        } else {
                          return _BreedsList(
                            breeds: filteredBreeds,
                            fetchingMore: fetchingMore,
                            scrollController: scrollController,
                            selectedBreed: selectedBreed,
                          );
                        }
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
        bottomNavigationBar: selectedBreed.value != null
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

class _BreedsList extends StatelessWidget {
  const _BreedsList({
    required this.breeds,
    required this.fetchingMore,
    required this.scrollController,
    required this.selectedBreed,
  });

  final List<Breed> breeds;
  final ValueNotifier<bool> fetchingMore;
  final ScrollController scrollController;
  final ValueNotifier<Breed?> selectedBreed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: ListView(
        controller: scrollController,
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final breed = breeds[index];
              final selected = selectedBreed.value == breed;

              return ListTile(
                tileColor: Colors.white,
                title: Text(
                  breed.name,
                  style: TextStyle(fontWeight: selected ? FontWeight.w600 : null),
                ),
                selected: selected,
                shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  selectedBreed.value = breed;
                },
                selectedTileColor: theme.primaryColor.withOpacity(0.2),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
            itemCount: breeds.length,
          ),
          if (fetchingMore.value)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: SizedBox(
                  height: 20,
                  child: LoadingIndicator(
                    indicatorType: Indicator.circleStrokeSpin,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.sadPets,
    required this.localizations,
    required this.imageIndex,
    required this.textStyles,
  });

  final List<String> sadPets;
  final AppLocalizations localizations;
  final int imageIndex;
  final TextStyles textStyles;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                sadPets[imageIndex],
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
    );
  }
}
