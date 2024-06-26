import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/interface/screens/edit_pet_name_screen.dart';
import 'package:fur/core/pet/presentation/interface/screens/edit_pet_weight_screen.dart';
import 'package:fur/core/pet/presentation/providers/retrieve_breed.dart';
import 'package:fur/core/pet/presentation/providers/retrieve_species.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetProfileBasicInfoScreen extends HookConsumerWidget with PetsMixin {
  PetProfileBasicInfoScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final languageCode = Localizations.localeOf(context).languageCode;

    final AsyncValue<Breed> breed = ref.watch(retrieveBreedProvider(
      languageCode,
      pet.breed,
      pet.species,
    ));

    final species = ref.watch(retrieveSpeciesProvider(
      languageCode,
      pet.species,
    ));

    final infos = <_InfoData>[
      _InfoData(
        title: 'Name',
        onEdit: (pet) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPetNameScreen(pet: pet),
            ),
          );
        },
        value: pet.name,
      ),
      _InfoData(
        title: 'Weight',
        onEdit: (pet) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPetWeightScreen(pet: pet),
            ),
          );
        },
        value: '${pet.weight} kg',
      ),
      _InfoData(
        title: 'Age',
        onEdit: (pet) {},
        value: parseAge(pet.dob, localizations),
        editable: false,
      ),
      _InfoData(
        title: 'Breed',
        onEdit: (pet) {},
        value: breed.when(
          data: (value) => value.name,
          error: (error, stacktrace) => '$error',
          loading: () => '...',
        ),
        editable: false,
      ),
      _InfoData(
        title: 'Species',
        onEdit: (pet) {},
        value: species.when(
          data: (value) => value.name,
          error: (error, stacktrace) => 'N/A',
          loading: () => '...',
        ),
        editable: false,
      ),
      _InfoData(
        title: 'Sex',
        onEdit: (pet) {},
        value: switch (pet.sex) {
          Sex.male => localizations.male,
          Sex.female => localizations.female,
        },
        editable: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: AppBackButton(),
            )
          ],
        ),
        title: Text(
          localizations.appPageTitlesBasicInformation,
          style: textStyles.h2,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final info = infos[index];

                return ListTile(
                  onTap: info.editable ? () => info.onEdit(pet) : null,
                  title: Text(
                    info.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: info.editable
                      ? Text(
                          info.value,
                          style: textStyles.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  trailing: info.editable
                      ? SvgPicture.asset(
                          AppIcons.edit,
                          height: 20,
                        )
                      : Text(
                          info.value,
                          style: textStyles.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: infos.length,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoData {
  final String title;
  final String value;
  final Function(Pet param) onEdit;
  final bool editable;

  _InfoData({
    required this.title,
    required this.value,
    required this.onEdit,
    this.editable = true,
  });
}
