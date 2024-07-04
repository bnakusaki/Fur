import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPetMarkingsDialog extends HookConsumerWidget with PetsMixin {
  EditPetMarkingsDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;
    final controller = useTextEditingController();

    final pet = ref.watch(petNotifierProvider)!;

    useMemoized(() {
      controller.text = pet.name;
    });

    Future<void> handleSave() async {
      try {
        await updatePet(pet.copyWith(name: controller.text));
        ref
            .watch(petNotifierProvider.notifier)
            .update((pet) => pet!.copyWith(name: controller.text));

        if (context.mounted) Navigator.pop(context);
      } on Failure catch (e) {
        if (context.mounted) AppSnackBar.error(context, e.code);
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localizations.appQuestionsPetName,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            AppTextFormField(
              controller: controller,
              autofocus: true,
            ),
            const SizedBox(height: 10),
            Text(
              localizations.appCaptionsInputPetName,
              style: textStyles.caption,
            ),
          ],
        ),
      ),
      bottomSheet: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.trim().isEmpty || value.text.trim() == pet.name) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                onPressed: null,
                child: Text(localizations.appButtonsUpdate),
              ).withLoadingState(onPressed: handleSave).animate().fadeIn().slideY(begin: 0.1),
            );
          }),
    );
  }
}
