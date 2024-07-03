import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_info/select_pet_breed_screen.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_info/select_pet_species_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class InputPetBasicInfoScreen extends HookConsumerWidget with PetsMixin {
  InputPetBasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final weigthController = useTextEditingController();
    final species = useState<Species?>(null);
    final breed = useState<Breed?>(null);
    final dob = useState<DateTime?>(null);

    Future<void> handleContinue() async {
      if (formKey.currentState!.validate()) {
        if (species.value == null) {
          AppSnackBar.warning(context, localizations.appValidationMessagesPetSpecies);
          return;
        } else if (breed.value == null) {
          AppSnackBar.warning(context, localizations.appValidationMessagesPetBreed);
          return;
        } else if (dob.value == null) {
          AppSnackBar.warning(context, localizations.appValidationMessagesPetDob);
          return;
        }
      }

      final pet = Pet.empty().copyWith(
        name: nameController.text,
        species: species.value!.id,
        breed: breed.value!.id,
        weight: {DateTime.now(): double.parse(weigthController.text)},
        dob: dob.value!,
        owner: FirebaseAuth.instance.currentUser!.uid,
      );

      try {
        await createPet(pet);
        if (context.mounted) {
          Navigator.pop(context);
        }
      } on Failure catch (e) {
        if (context.mounted) {
          AppSnackBar.error(context, e.code);
        }
      }
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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    localizations.petName,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    controller: nameController,
                    hintText: localizations.appTextFieldHintsPetName,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return localizations.appValidationMessagesPetName;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.species,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectPetspeciesScreen(
                            onSelect: (value) {
                              if (value != species.value) {
                                species.value = value;
                                breed.value = null;
                              }

                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                    title: Text(species.value?.name ?? localizations.selectSpecies),
                    trailing: SvgPicture.asset(AppIcons.angleSmallRight),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.breed,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () {
                      if (species.value == null) {
                        AppSnackBar.info(
                          context,
                          localizations.appValidationMessagesSelectSpeciesBeforeBreed,
                        );
                        return;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectPetBreedScreen(
                            onSelect: (value) {
                              breed.value = value;
                              Navigator.pop(context);
                            },
                            speciesId: species.value!.id,
                          ),
                        ),
                      );
                    },
                    title: Text(breed.value?.name ?? localizations.selectBreed),
                    trailing: SvgPicture.asset(AppIcons.angleSmallRight),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.weightInKilograms,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  AppTextFormField(
                    controller: weigthController,
                    hintText: localizations.appTextFieldHintsEnterWeight,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return localizations.appValidationMessagesPetWeight;
                      } else if (value.split('.').length > 2) {
                        return localizations.appValidationMessagesInvalidPetWeight;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    localizations.birthDate,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    onTap: () async {
                      dob.value ??= await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                    },
                    title: dob.value == null
                        ? Text(localizations.pickDate)
                        : Text(DateFormat('MMMM dd, yyyy').format(dob.value!)),
                    trailing: SvgPicture.asset(AppIcons.calendarPlus),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 20,
            right: 20,
          ),
          child: ElevatedButton(
            onPressed: null,
            child: Text(localizations.appButtonsContinue),
          ).withLoadingState(onPressed: handleContinue).animate().fadeIn().slideY(begin: 0.1),
        ),
      ),
    );
  }
}
