import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_name_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/src/home/presentation/interface/widgets/app_drawer.dart';
import 'package:fur/src/home/presentation/interface/widgets/pets_carousel.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final menuAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    return Scaffold(
      onDrawerChanged: (isOpened) {
        if (!isOpened) {
          menuAnimationController.reverse();
        } else {
          menuAnimationController.forward();
        }
      },
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: LottieBuilder.asset(
              controller: menuAnimationController,
              AppAnimatedIcons.menuV2,
              frameRate: FrameRate.max,
            ),
          );
        }),
      ),
      drawer: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.0),
          child: AppDrawer(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.myPets,
                    style: textStyles.h2,
                  ),
                  IconButton.filledTonal(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InputPetNameScreen(),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      AppIcons.plus,
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            const PetsCarousel(),
          ],
        ),
      ),
    );
  }
}
