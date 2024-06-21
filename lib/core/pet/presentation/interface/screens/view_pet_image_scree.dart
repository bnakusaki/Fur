import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/presentation/interface/screens/select_animal_screen.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:image_picker/image_picker.dart';

class ViewPetImageScreen extends HookWidget {
  const ViewPetImageScreen({super.key, required this.image});

  final XFile image;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    Future<void> handleSave() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectAnimalScreen(),
        ),
      );
    }

    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBackButton(),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: handleSave,
              child: Text(localizations.appButtonsSave),
            ),
          ],
        ),
        body: Center(
          child: Image.file(
            File(image.path),
            fit: BoxFit.cover,
          ),
        ));
  }
}
