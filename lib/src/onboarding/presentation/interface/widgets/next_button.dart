// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton.filledTonal(
      style: IconButton.styleFrom(
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 0.1,
        ),
        fixedSize: const Size(50, 50),
        backgroundColor: theme.primaryColor.withOpacity(0.02),
        foregroundColor: theme.primaryColor.withOpacity(0.02),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        AppIcons.arrowSmallRight,
        color: theme.primaryColor,
      ),
    );
  }
}
