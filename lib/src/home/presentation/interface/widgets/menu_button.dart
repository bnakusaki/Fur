import 'package:flutter/material.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:lottie/lottie.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.animationController,
  });

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: LottieBuilder.asset(
          controller: animationController,
          AppAnimatedIcons.menuV2,
          frameRate: FrameRate.max,
        ),
      );
    });
  }
}
