import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPetNameScreen extends HookConsumerWidget with PetsMixin {
  EditPetNameScreen({super.key, required this.pet, required this.name});
  final ValueNotifier<Pet> pet;
  final ValueNotifier<String> name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final name0 = useState(pet.value.name);

    Future<void> handleSave() async {
      try {
        pet.value = pet.value.copyWith(name: name0.value);
        name.value = name0.value;
        ref.watch(cachedPetsProvider.notifier).updatePet(pet.value);
        await updatePet(pet.value);
        if (context.mounted) Navigator.pop(context);
      } on Failure catch (e) {
        if (context.mounted) AppSnackBar.error(context, e.code);
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const Row(
            children: [
              AppBackButton(),
            ],
          ),
          title: Text(
            localizations.appPageTitlesEditPetName,
            style: textStyles.h2,
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                localizations.appTextFieldHintsEnterNewName,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                initialValue: name0.value,
                hintText: localizations.appTextFieldHintsPetName,
                onChanged: (value) {
                  name0.value = value!.trim();
                },
              ),
              const SizedBox(height: 10),
              Text(
                localizations.appCaptionsInputPetName,
                style: textStyles.caption,
              )
            ],
          ),
        ),
        bottomNavigationBar: name0.value != pet.value.name && name0.value.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 20,
                  left: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(localizations.appButtonsUpdate),
                ).withLoadingState(onPressed: handleSave).animate().fadeIn().slideY(begin: 0.1),
              )
            : null,
      ),
    );
  }
}
