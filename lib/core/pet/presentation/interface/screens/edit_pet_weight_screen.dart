import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPetWeightScreen extends HookConsumerWidget with PetsMixin {
  EditPetWeightScreen({super.key, required this.pet, required this.weight});

  final ValueNotifier<Pet> pet;
  final ValueNotifier<double> weight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final weight0 = useState(pet.value.weight);

    Future<void> handleSave() async {
      try {
        pet.value = pet.value.copyWith(weight: weight0.value);
        weight.value = weight0.value;
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
          leading: const Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: AppBackButton(),
            ),
          ]),
          title: Text(
            localizations.appPageTitlesEditPetWeight,
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
                localizations.appTextFieldHintsEnterNewWeight,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppTextFormField(
                      hintText: localizations.appTextFieldHintsEnterWeight,
                      initialValue: weight0.value.toString(),
                      onChanged: (value) {
                        weight0.value = double.parse(value!);
                      },
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
        bottomNavigationBar: weight0.value != pet.value.weight && weight0.value > 0
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
