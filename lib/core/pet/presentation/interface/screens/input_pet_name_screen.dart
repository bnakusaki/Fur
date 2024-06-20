import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_picture_scree.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';

class InputPetNameScreen extends HookWidget {
  const InputPetNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final nameController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBackButton(),
        centerTitle: false,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              localizations.petNameQuestion,
              style: textStyles.h2,
            ),
            const SizedBox(height: 10),
            AppTextFormField(
              controller: nameController,
              hintText: localizations.appTextFieldHintsPetName,
            ),
            const SizedBox(height: 10),
            Text(
              localizations.petNameCaption,
              style: textStyles.caption,
            )
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: nameController,
        builder: (context, value, child) {
          return value.text.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 20,
                    left: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InputPetPictureScreen(),
                        ),
                      );
                    },
                    child: Text(localizations.appButtonsContinue),
                  ).animate().fadeIn().slideY(begin: 0.1),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
