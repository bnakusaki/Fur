import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/core/pet/presentation/interface/screens/add_pet_screen.dart';
import 'package:fur/core/pet/presentation/providers/list_breeds.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class SelectPetBreed extends HookConsumerWidget {
  const SelectPetBreed({
    super.key,
    required this.theme,
    required this.textStyles,
    required this.selectedBreed,
    required this.imageAnalysis,
  });

  final ThemeData theme;
  final TextStyles textStyles;
  final ValueNotifier<PetBreed?> selectedBreed;
  final PetImageAnalysisResult? imageAnalysis;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breeds = ref.watch(listBreedsProvider(Localizations.localeOf(context).languageCode));

    final searchFieldController = useTextEditingController();
    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchTerm = useState('');
    final searchFieldFocusNode = useFocusNode();
    final suggestedBreed = useState<PetBreed?>(null);

    breeds.whenData((data) {
      final breed = data.firstWhere(
        (breed) => breed.name.toLowerCase() == imageAnalysis?.breed.toLowerCase(),
        orElse: () => PetBreed.empty(),
      );
      suggestedBreed.value = breed;
    });

    return SafeArea(
      minimum: const EdgeInsets.only(
        left: AppSizes.screenHorizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.screenHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'What is your pet\'s breed?',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                AppTextFormField(
                  focusNode: searchFieldFocusNode,
                  controller: searchFieldController,
                  hintText: 'Search breeds',
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
                        searchFieldFocusNode.requestFocus();
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
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: switch (breeds) {
              AsyncData(:final value) => Builder(builder: (context) {
                  final breeds = searchTerm.value.trim().isEmpty
                      ? value
                      : value
                          .where(
                            (breed) => breed.name.trim().toLowerCase().contains(
                                  searchTerm.value.toLowerCase().trim(),
                                ),
                          )
                          .toList();

                  return breeds.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Scrollbar(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: AppSizes.screenHorizontalPadding - 10),
                              child: ListView(
                                children: [
                                  if (suggestedBreed.value != null &&
                                      suggestedBreed.value != PetBreed.empty() &&
                                      searchTerm.value.isEmpty)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Suggested breed', style: textStyles.caption),
                                        GridView.count(
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          padding: const EdgeInsets.only(bottom: 10),
                                          children: [
                                            Card(
                                              color: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  width: 2,
                                                  color: selectedBreed.value == suggestedBreed.value
                                                      ? theme.primaryColor
                                                      : Colors.transparent,
                                                ),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  selectedBreed.value = suggestedBreed.value!;
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    suggestedBreed.value!.name,
                                                    style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 5.0),
                                          child: Text('All breeds', style: textStyles.caption),
                                        ),
                                      ],
                                    ),
                                  GridView.count(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    children: List.generate(
                                      breeds.length,
                                      (index) => Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          side: BorderSide(
                                            width: 2,
                                            color: selectedBreed.value == breeds[index]
                                                ? theme.primaryColor
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            selectedBreed.value = breeds[index];
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              breeds[index].name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: AppSizes.screenHorizontalPadding),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.boneBreak,
                                  height: 150,
                                ),
                                Text(
                                  'No breeds found',
                                  style: textStyles.emptyState,
                                ),
                              ],
                            ),
                          ),
                        );
                }),
              AsyncError(:final error as Failure) => Padding(
                  padding: const EdgeInsets.only(right: AppSizes.screenHorizontalPadding),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.boneBreak,
                          height: 150,
                        ),
                        Text(
                          error.message(context),
                          style: textStyles.emptyState,
                        ),
                      ],
                    ),
                  ),
                ),
              _ => GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    50,
                    (index) => Shimmer.fromColors(
                      baseColor: Colors.grey[100]!,
                      highlightColor: Colors.grey[50]!,
                      child: const Card(),
                    ),
                  ),
                )
            },
          )
        ],
      ),
    );
  }
}
