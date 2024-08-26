import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:image_picker/image_picker.dart';

class InputPetName extends StatelessWidget {
  const InputPetName({
    super.key,
    required this.image,
    required this.theme,
    required this.petNameController,
  });

  final ValueNotifier<XFile?> image;
  final ThemeData theme;
  final TextEditingController petNameController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              backgroundImage: FileImage(
                File(image.value!.path),
              ),
              radius: 100,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'What\'s your pet\'s name?',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          AppTextFormField(
            hintText: 'Enter pet name',
            controller: petNameController,
          ),
        ],
      ),
    );
  }
}
