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
import 'package:logger/logger.dart';
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
    final scrollController = useScrollController();
    final breedsCache = useState<List<Breed>>([]);
    final fetchingMore = useState(false);
    final searchTerm = useState('');
    final allDataFetched = useState(false);

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
      ),
    );
  }
}

class _BreedsList extends StatelessWidget {
  const _BreedsList({
    required this.breeds,
    required this.fetchingMore,
    required this.scrollController,
  });

  final List<Breed> breeds;
  final ValueNotifier<bool> fetchingMore;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            late List<Breed> row;
            try {
              row = breeds.sublist(index * 2, (index * 2) + 2);
            } catch (e) {
              row = [breeds[index * 2], Breed.empty()];
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: row
                  .map((animal) => Expanded(
                        child: animal == Breed.empty()
                            ? const SizedBox()
                            : ImageAndLabel(
                                fillCard: false,
                                imageUrl: animal.imageUrl,
                                label: animal.name,
                                onTap: () {},
                              ),
                      ))
                  .toList(),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: (breeds.length / 2).ceil(),
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
