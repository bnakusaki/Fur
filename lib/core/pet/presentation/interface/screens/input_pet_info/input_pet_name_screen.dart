import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_info/select_pet_species_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputPetNameScreen extends HookConsumerWidget {
  const InputPetNameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final controller = useTextEditingController();

    void handleContinue() {
      final pet = Pet.empty().copyWith(name: controller.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectPetspeciescreen(pet: pet),
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
          leading: const BackButton(),
          title: Text(localizations.appPageTitlesBasicInformation),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Pet name',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                controller: controller,
                hintText: localizations.appTextFieldHintsPetName,
              ),
              const SizedBox(height: 20),
              Text(
                'Species',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: const Text('Select species'),
                trailing: SvgPicture.asset(AppIcons.angleSmallRight),
              ),
              const SizedBox(height: 20),
              Text(
                'Breed',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: const Text('Select breed'),
                trailing: SvgPicture.asset(AppIcons.angleSmallRight),
              ),
              const SizedBox(height: 20),
              Text(
                'Weight',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              AppTextFormField(
                controller: controller,
                hintText: localizations.appTextFieldHintsEnterWeight,
              ),
              const SizedBox(height: 20),
              Text(
                'Birth date',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              ListTile(
                onTap: () {},
                title: const Text('Pick date'),
                trailing: SvgPicture.asset(AppIcons.calendarPlus),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return value.text.trim().isNotEmpty
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
