// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: IconButton.styleFrom(
        fixedSize: const Size(50, 50),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        AppIcons.check,
        color: Colors.white,
      ),
    );
  }
}
