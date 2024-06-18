// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:intl/intl.dart';

class InputPetAgeScreen extends HookWidget {
  const InputPetAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final localizations = AppLocalizations.of(context)!;

    final date = useState<DateTime?>(null);

    String calculateAge(DateTime dob) {
      final now = DateTime.now();

      const Assert('dob.isBefore(now)', 'Date of birth must be in the past');

      final yearsOld = now.year - dob.year;
      final monthsOld = now.month - dob.month;

      if (yearsOld > 0 || monthsOld > 0) {
        return '$yearsOld years, $monthsOld months';
      } else {
        final daysOld = now.day - dob.day;
        final weeksOld = daysOld ~/ 7;

        if (weeksOld > 0) {
          return '$weeksOld weeks, $daysOld days';
        }
        return '$daysOld days';
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBackButton(),
          centerTitle: false,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(localizations.appButtonsSkip),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'When was your dog born?',
                  style: textStyles.h2,
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Date of birth:   ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: date.value == null
                            ? 'N/A'
                            : DateFormat('MMMM dd, yyyy').format(date.value!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Age:   ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: date.value == null ? 'N/A' : calculateAge(date.value!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                TextButton.icon(
                  onPressed: () async {
                    date.value = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                  },
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 48),
                    backgroundColor: theme.primaryColor.withOpacity(0.1),
                    alignment: Alignment.centerLeft,
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(16),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppIcons.calendarPlus,
                    color: theme.primaryColor,
                    height: 20,
                  ),
                  label: const Text('Pick date'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'You this button to pick the birth date of your dog.',
                  style: TextStyle(fontSize: 10),
                ),
              ].animate(interval: 10.milliseconds).fadeIn(),
            ),
          ),
        ),
        bottomNavigationBar: date.value != null
            ? Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.paddingOf(context).bottom + 20,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(localizations.appButtonsContinue),
                ),
              ).animate().fadeIn().slideY(begin: 0.1)
            : null,
      ),
    );
  }
}
