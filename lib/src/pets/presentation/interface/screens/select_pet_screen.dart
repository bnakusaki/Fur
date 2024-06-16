import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/image_and_label.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';
import 'package:fur/src/pets/domain/entities/pet.dart';
import 'package:fur/src/pets/presentation/bloc/pet_bloc.dart';
import 'package:fur/src/pets/presentation/interface/screens/select_pet_breed.dart';
import 'package:lottie/lottie.dart';

class SelectPetScreen extends HookWidget with PetMixin {
  const SelectPetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchController = useTextEditingController();
    final searchFieldFocusNode = useFocusNode();

    final searchTerm = useState('');
    final pets = useState<List<Pet>>([]);

    final sadPets = [
      AppImages.sadCat,
      AppImages.sadDog,
      AppImages.sadHamster,
      AppImages.sadHorse,
      AppImages.sadRabbit,
    ];

    final randInt = useState(Random().nextInt(sadPets.length));

    useEffect(() {
      if (searchTerm.value.trim().isEmpty) {
        pets.value = Pet.values;
      } else {
        pets.value = Pet.values.where(
          (pet) {
            return pet.name.toLowerCase().contains(
                  searchTerm.value.toLowerCase().trim(),
                );
          },
        ).toList();
      }

      if (pets.value.isEmpty) {
        randInt.value = Random().nextInt(sadPets.length);
      }
      return null;
    }, [searchTerm.value]);

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
                localizations.whatPetDoYouOwn,
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
              pets.value.isEmpty
                  ? Builder(builder: (context) {
                      return Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: MediaQuery.of(context).size.width * 0.6,
                                child: Expanded(
                                  child: Card(
                                    elevation: 0,
                                    color: Colors.transparent,
                                    shape: CircleBorder(
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 4,
                                      ),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      sadPets[randInt.value],
                                      fit: BoxFit.cover,
                                    ).animate().fadeIn(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                localizations.noPetsFound,
                                style: textStyles.emptyState,
                              )
                            ],
                          ),
                        ),
                      );
                    })
                  : Expanded(
                      child: GridView.count(
                        padding: const EdgeInsets.only(bottom: 20),
                        shrinkWrap: true,
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: pets.value
                            .map((pet) {
                              return ImageAndLabel(
                                image: getPetImage(pet),
                                label: getPetName(context, pet),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectPetBreed(pet: pet),
                                    ),
                                  );
                                },
                              );
                            })
                            .toList()
                            .animate(interval: 50.milliseconds)
                            .fadeIn()
                            .scaleXY(begin: 0.9),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
