import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:lottie/lottie.dart';

class PetsCarouselEmptyState extends StatelessWidget {
  const PetsCarouselEmptyState({
    super.key,
    required this.error,
  });

  final Failure error;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(pi),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AppImages.pet),
                  fit: BoxFit.cover,
                ),
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LottieBuilder.asset(
                    AppAnimatedIcons.alertTriangle,
                    repeat: false,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    error.code,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
