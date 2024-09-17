// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: SmoothCard(
        borderRadius: BorderRadius.circular(10),
        smoothness: 1,
        color: Colors.transparent,
        side: BorderSide(
          color: theme.colorScheme.onPrimary.withOpacity(0.3),
          width: 1.5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AppIcons.arrowSmallLeft,
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
