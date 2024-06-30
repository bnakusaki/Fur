import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/interface/screens/save_pet_basic_info_screen.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPetWeightScreen extends HookConsumerWidget {
  const InputPetWeightScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final weightFieldController = useTextEditingController();

    void handleContinue() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SavePetBasicInfoScreen(
            pet: pet.copyWith(
              weight: {DateTime.now(): double.parse(weightFieldController.text)},
            ),
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
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                localizations.appQuestionsInputPetWeight(pet.name.capitalize()),
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppTextFormField(
                      controller: weightFieldController,
                      hintText: localizations.appTextFieldHintsEnterWeight,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      localizations.kilogramSIUnit,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                localizations.appCaptionsInputPetWeight,
                style: textStyles.caption,
              )
            ],
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: weightFieldController,
          builder: (context, value, child) {
            return value.text.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 20,
                      left: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: handleContinue,
                      child: Text(localizations.appButtonsContinue),
                    ).animate().fadeIn().slideY(begin: 0.1),
                  )
                : const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
