import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fur/shared/styles/app_sizes.dart';

class SelectPetBirthDate extends StatelessWidget {
  const SelectPetBirthDate({
    super.key,
    required this.petNameController,
    required this.theme,
    required this.birthDate,
  });

  final TextEditingController petNameController;
  final ThemeData theme;
  final ValueNotifier<DateTime?> birthDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'What is ${petNameController.text}\'s birth date?',
            style: theme.textTheme.titleMedium,
          ),
          const Spacer(),
          SizedBox(
              height: MediaQuery.sizeOf(context).height - 256,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  birthDate.value = value;
                },
                initialDateTime: DateTime.now(),
                maximumDate: DateTime.now(),
              ))
        ],
      ),
    );
  }
}
