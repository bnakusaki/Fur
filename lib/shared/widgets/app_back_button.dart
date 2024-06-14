// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      style: IconButton.styleFrom(
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 2,
        ),
        backgroundColor: Colors.transparent,
      ),
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      icon: SvgPicture.asset(
        AppIcons.angleLeft,
        height: 20,
        width: 20,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
