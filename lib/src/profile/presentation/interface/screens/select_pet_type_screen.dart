import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';
import 'package:fur/src/profile/presentation/interface/widgets/animal_card.dart';
import 'package:lottie/lottie.dart';

class SelectPetTypeScreen extends HookWidget {
  const SelectPetTypeScreen({super.key});

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
                'What kind of pet do you own?',
                style: textStyles.h2,
              ),
              const SizedBox(height: 20),
              AppTextFormField(
                controller: searchController,
                hintText: 'Search pets',
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
                  childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: const [
                    AnimalCard(),
                  ].animate(interval: 250.milliseconds).fadeIn().scaleXY(begin: 0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
