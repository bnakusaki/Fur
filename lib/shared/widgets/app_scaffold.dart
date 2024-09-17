import 'package:flutter/material.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_corner/smooth_corner.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, this.body});
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.canPop(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: canPop ? const AppBackButton() : null,
        title: Text(
          'FUR',
          style: GoogleFonts.sofadiOne(
            fontSize: 30,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
      body: SmoothContainer(
        width: double.maxFinite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        smoothness: 1,
        margin: const EdgeInsets.only(top: 25),
        color: Colors.white,
        child: body,
      ),
    );
  }
}
