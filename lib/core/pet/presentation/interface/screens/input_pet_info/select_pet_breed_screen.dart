import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/providers/list_breeds.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';

class SelectPetBreedScreen extends HookConsumerWidget with PetsMixin {
  SelectPetBreedScreen({super.key, required this.speciesId, required this.onSelect});

  final String speciesId;
  final void Function(Breed breed) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;
    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchFieldController = useTextEditingController();
    final scrollController = useScrollController();
    final searchTerm = useState('');
    final selectedBreed = useState<Breed?>(null);

    final breeds =
        ref.watch(listBreedsProvider(Localizations.localeOf(context).languageCode, speciesId));

    final randInt = useState(Random().nextInt(sadPets.length));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                localizations.selectPetBreed,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                controller: searchFieldController,
                hintText: localizations.appTextFieldHintsSearch,
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
                    if (searchFieldController.text.isNotEmpty) {
                      searchFieldController.clear();
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
                  AsyncData(:final value) => Builder(
                      builder: (context) {
                        final filteredBreeds = searchTerm.value.isEmpty
                            ? value
                            : value
                                .where((species) => species.name
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
                  onPressed: () {
                    onSelect(selectedBreed.value!);
                  },
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
    required this.scrollController,
    required this.selectedBreed,
  });

  final List<Breed> breeds;
  final ScrollController scrollController;
  final ValueNotifier<Breed?> selectedBreed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: ListView.separated(
        shrinkWrap: true,
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
