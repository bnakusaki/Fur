import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';
import 'package:fur/src/dog/entities/dog_breeds.dart';
import 'package:fur/src/dog/presentation/interface/widgets/dog_breed_card.dart';
import 'package:lottie/lottie.dart';

class SelectDogBreed extends HookWidget {
  const SelectDogBreed({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final animationController = useAnimationController(duration: const Duration(milliseconds: 500));
    final searchController = useTextEditingController();

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
                'What is the breed of your dog?',
                style: textStyles.h2,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                controller: searchController,
                hintText: 'Search breeds',
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
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                  // crossAxisSpacing: 10,
                  children: DogBreed.values
                      .map(
                        (breed) => DogBreedCard(breed: breed),
                      )
                      .toList()
                      .animate(interval: 10.milliseconds)
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
