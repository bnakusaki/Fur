import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:lottie/lottie.dart';

class NotificationsButton extends HookWidget {
  const NotificationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationBellAnimationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    return IconButton(
      onPressed: () {},
      icon: LottieBuilder.asset(
        controller: notificationBellAnimationController,
        AppAnimatedIcons.notificationV3,
        frameRate: FrameRate.max,
      ),
    );
  }
}
