import 'package:flutter/material.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:lottie/lottie.dart';

class AppSnackBar {
  static success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          LottieBuilder.asset(
            AppAnimatedIcons.checkmark,
            frameRate: FrameRate.max,
            repeat: false,
          ),
          const SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(color: Colors.green.shade900),
          ),
        ],
      ),
      backgroundColor: Colors.green.shade50,
    ));
  }

  static error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          LottieBuilder.asset(
            AppAnimatedIcons.alertTriangle,
            frameRate: FrameRate.max,
            repeat: false,
          ),
          const SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(color: Colors.red.shade900),
          ),
        ],
      ),
      backgroundColor: Colors.red.shade50,
    ));
  }

  static warning(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          LottieBuilder.asset(
            AppAnimatedIcons.alertTriangle,
            frameRate: FrameRate.max,
            repeat: false,
          ),
          const SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(color: Colors.orange.shade900),
          ),
        ],
      ),
      backgroundColor: Colors.orange.shade50,
    ));
  }

  static info(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          LottieBuilder.asset(
            AppAnimatedIcons.alertCircle,
            frameRate: FrameRate.max,
            repeat: false,
          ),
          const SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(color: Colors.blue.shade900),
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade50,
    ));
  }
}
