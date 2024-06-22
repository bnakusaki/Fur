// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/presentation/interface/screens/add_pet_picture_screen.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:intl/intl.dart';

class InputPetName extends HookWidget {
  const InputPetName({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final textStyles = Theme.of(context).extension<TextStyles>()!;
    final theme = Theme.of(context);

    final date = useState<DateTime?>(null);
    final sex = useState<Sex?>(null);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const AppBackButton(),
          centerTitle: false,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'What is your pet\'s name?',
                style: textStyles.h2,
              ),
              const SizedBox(height: 10),
              const AppTextFormField(
                hintText: 'Pet\'s name',
              ),
              const SizedBox(height: 40),
              Text(
                'What is your pet\'s sex?',
                style: textStyles.h2,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      icon: SvgPicture.asset(
                        AppIcons.male,
                        height: 20,
                        color: sex.value == Sex.male ? Colors.blue : Colors.black,
                      ),
                      style: TextButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: sex.value == Sex.male ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        backgroundColor: Colors.blue.shade50,
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        foregroundColor: sex.value == Sex.male ? Colors.blue : Colors.black,
                      ),
                      onPressed: () {
                        sex.value = Sex.male;
                      },
                      label: const Text('Male'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextButton.icon(
                      icon: SvgPicture.asset(
                        AppIcons.female,
                        height: 20,
                        color: sex.value == Sex.female ? Colors.pink : Colors.black,
                      ),
                      style: TextButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: sex.value == Sex.female ? Colors.pink : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        backgroundColor: Colors.pink.shade50,
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        foregroundColor: sex.value == Sex.female ? Colors.pink : Colors.black,
                      ),
                      onPressed: () {
                        sex.value = Sex.female;
                      },
                      label: const Text('Female'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'When was your pet born?',
                style: textStyles.h2,
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                icon: SvgPicture.asset(
                  AppIcons.calendarPlus,
                  height: 20,
                  color: theme.primaryColor,
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  backgroundColor: theme.primaryColor.withOpacity(0.1),
                  fixedSize: const Size.fromWidth(double.maxFinite),
                  foregroundColor: theme.primaryColor,
                ),
                onPressed: () async {
                  date.value = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ) ??
                      date.value;
                },
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    date.value != null
                        ? Text(
                            DateFormat('MMMM dd, yyyy').format(date.value!),
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                          )
                        : const Text('Pick date'),
                    if (date.value != null)
                      const Text(
                        'Change',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.paddingOf(context).bottom + 20,
            left: 20,
            right: 20,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPetPictureScreen(),
                ),
              );
            },
            child: Text(localizations.appButtonsContinue),
          ).animate().fadeIn().slideY(begin: 0.1),
        ),
      ),
    );
  }
}
