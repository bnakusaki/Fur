// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_sex_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:intl/intl.dart';

class InputPetAgeScreen extends HookWidget {
  const InputPetAgeScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final years = useState(0);
    final months = useState(0);
    final weeks = useState(0);
    final days = useState(0);

    final date = useState<DateTime?>(null);

    final dateFields = [
      _DateFieldData(
        title: localizations.appTextFieldHintsYears,
        value: years,
      ),
      _DateFieldData(
        title: localizations.appTextFieldHintsMonths,
        value: months,
      ),
      _DateFieldData(
        title: localizations.appTextFieldHintsWeeks,
        value: weeks,
      ),
      _DateFieldData(
        title: localizations.appTextFieldHintsDays,
        value: days,
      ),
    ];

    useEffect(() {
      final now = DateTime.now();

      date.value = DateTime(
        now.year - years.value,
        now.month - months.value,
        now.day - weeks.value * 7 - days.value,
      );

      return null;
    }, [
      years.value,
      months.value,
      weeks.value,
      days.value,
    ]);

    void handleContinue() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InputPetSexScreen(
            pet: pet.copyWith(dob: date.value!),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AppBackButton(),
            ),
          ]),
          title: Text(
            localizations.appPageTitlesBasicInformation,
            style: textStyles.h2,
          ),
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
                  localizations.appQuestionsInputPetAge(pet.name.capitalize()),
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _DateField(data: dateFields[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: dateFields.length,
                ),
                const SizedBox(height: 10),
                if (date.value != null)
                  Text(
                    DateFormat('MMMM dd, yyyy').format(date.value!),
                    style: textStyles.caption,
                  ).animate().fadeIn(),
                const SizedBox(height: 40),
                Text(
                  localizations.appCaptionsPetAgeInputOptions,
                  style: textStyles.caption,
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () async {
                    final date0 = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (date0 != null) {
                      date.value = date0;
                      final difference = DateTime.now().difference(date0);
                      years.value = difference.inDays ~/ 365;
                      months.value = (difference.inDays % 365) ~/ 30;
                      weeks.value = ((difference.inDays % 365) % 30) ~/ 7;
                      days.value = ((difference.inDays % 365) % 30) % 7;
                    }
                  },
                  icon: SvgPicture.asset(
                    AppIcons.calendarPlus,
                    color: theme.primaryColor,
                    height: 20,
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: theme.primaryColor.withOpacity(0.1),
                  ),
                  label: Text(localizations.appButtonsSelectBirthDate),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: date.value != null &&
                (years.value > 0 || months.value > 0 || weeks.value > 0 || days.value > 0)
            ? Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: MediaQuery.paddingOf(context).bottom + 20,
                ),
                child: ElevatedButton(
                  onPressed: handleContinue,
                  child: Text(localizations.appButtonsContinue),
                ),
              ).animate().fadeIn().slideY(begin: 0.1)
            : null,
      ),
    );
  }
}

class _DateField extends HookWidget {
  const _DateField({required this.data});

  final _DateFieldData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = useTextEditingController();

    useEffect(() {
      controller.text = data.value.value.toString();
      return null;
    }, [data.value.value]);

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: AppTextFormField(
            controller: controller,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) {
              if (value?.isEmpty ?? true) {
                controller.text = '0';
              } else if (value![0] == '0') {
                controller.text = value.substring(1);
              }

              data.value.value = int.parse(controller.text);
            },
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            data.title,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

class _DateFieldData {
  final String title;
  final ValueNotifier<int> value;

  _DateFieldData({
    required this.title,
    required this.value,
  });
}
