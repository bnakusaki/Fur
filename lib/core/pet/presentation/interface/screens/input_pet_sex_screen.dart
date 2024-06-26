// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_weight_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';

class InputPetSexScreen extends HookWidget {
  const InputPetSexScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    void handleOnPressed(Sex sex) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return InputPetWeightScreen(
              pet: pet.copyWith(sex: sex),
            );
          },
        ),
      );
    }

    return Scaffold(
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
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              localizations.appQuestionsSelectPetSex(pet.name.capitalize()),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                handleOnPressed(Sex.male);
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
              label: Text(localizations.male),
            ),
            const SizedBox(height: 0),
            TextButton.icon(
              onPressed: () {
                handleOnPressed(Sex.female);
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
              label: Text(localizations.female),
            ),
          ],
        ),
      ),
    );
  }
}
