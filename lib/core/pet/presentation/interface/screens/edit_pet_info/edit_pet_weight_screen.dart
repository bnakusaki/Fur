import 'package:flutter/material.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetWeightScreen extends HookConsumerWidget with PetsMixin {
  PetWeightScreen({super.key, required this.pet, required this.weight});

  final ValueNotifier<Pet> pet;
  final ValueNotifier<Map<DateTime, double>> weight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

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
            localizations.appPageTitlesPetWeight(pet.value.name),
            style: textStyles.h2,
          ),
        ),
        body: const SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: Placeholder(),
        ),
      ),
    );
  }
}
