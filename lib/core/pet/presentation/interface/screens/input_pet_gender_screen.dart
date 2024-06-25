// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';

class InputPetGenderScreen extends HookWidget {
  const InputPetGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final sex = useState<Sex?>(null);

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
                  'What is Benny\'s Sex?',
                  style: textStyles.h2,
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    sex.value = Sex.male;
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.blue.shade50,
                    fixedSize: const Size.fromWidth(double.maxFinite),
                    alignment: Alignment.centerLeft,
                  ),
                  icon: SvgPicture.asset(
                    AppIcons.male,
                    height: 20,
                    color: Colors.blue,
                  ),
                  label: const Text('Male'),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {
                    sex.value = Sex.female;
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.pink,
                    backgroundColor: Colors.pink.shade50,
                    fixedSize: const Size.fromWidth(double.maxFinite),
                    alignment: Alignment.centerLeft,
                  ),
                  icon: SvgPicture.asset(
                    AppIcons.female,
                    height: 20,
                    color: Colors.pink,
                  ),
                  label: const Text('Female'),
                ),
              ].animate(interval: 10.milliseconds).fadeIn(),
            ),
          ),
        ),
      ),
    );
  }
}
