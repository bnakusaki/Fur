// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';

class InputPetAgeScreen extends HookWidget {
  const InputPetAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final years = useState(0);
    final months = useState(0);
    final weeks = useState(0);
    final days = useState(0);

    final dateFields = [
      _DateFieldData(
        title: 'Years',
        value: years,
      ),
      _DateFieldData(
        title: 'Months',
        value: months,
      ),
      _DateFieldData(
        title: 'Weeks',
        value: weeks,
      ),
      _DateFieldData(
        title: 'Days',
        value: days,
      ),
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Row(children: [
            const AppBackButton(),
          ]),
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
                  'How old is Benny?',
                  style: textStyles.h2,
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
                const SizedBox(height: 40),
                const Text(
                    'You can select the date of bith of benny from a calendar by clicking the button below.'),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (date != null) {
                      final difference = DateTime.now().difference(date);
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
                  label: const Text('Select birth date'),
                )
              ].animate(interval: 10.milliseconds).fadeIn(),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.paddingOf(context).bottom + 20,
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(localizations.appButtonsContinue),
          ),
        ).animate().fadeIn().slideY(begin: 0.1),
      ),
    );
  }
}

class _DateField extends HookWidget {
  const _DateField({required this.data});

  final _DateFieldData data;

  @override
  Widget build(BuildContext context) {
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
