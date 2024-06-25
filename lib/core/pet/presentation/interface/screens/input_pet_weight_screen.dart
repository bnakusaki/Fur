import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/providers/add_pet_form_notifier.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPetWeightScreen extends HookConsumerWidget {
  const InputPetWeightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final nameController = useTextEditingController();

    void handleContinue() {
      ref
          .watch(addPetFormNotifierProvider.notifier)
          .update((pet) => pet.copyWith(name: nameController.text));

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const InputPetPictureScreen(),
      //   ),
      // );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Row(children: [
          const AppBackButton(),
        ]),
        centerTitle: false,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'What is Benny\'s Weight?',
              style: textStyles.h2,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextFormField(
                    controller: nameController,
                    hintText: 'Enter weight',
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                    child: Text('kg',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ))),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Enter your pet\'s weight in kilograms.',
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
                    onPressed: handleContinue,
                    child: Text(localizations.appButtonsContinue),
                  ).animate().fadeIn().slideY(begin: 0.1),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
