import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetProfileBehavorialInformationScreen extends HookConsumerWidget with PetsMixin {
  PetProfileBehavorialInformationScreen({super.key, required this.pet});

  final ValueNotifier<Pet> pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    // final name = useState(pet.value.name);
    // final weight = useState(pet.value.weight);

    // useEffect(() {
    //   name.value = pet.value.name;
    //   return null;
    // }, [pet.value.name]);

    // useEffect(() {
    //   weight.value = pet.value.weight;
    //   return null;
    // }, [pet.value.weight]);

    var infos = <_InfoData>[
      _InfoData(
        title: 'Temprament',
        onEdit: (pet) {},
        value: pet.value.color,
      ),
      _InfoData(
        title: 'Training level',
        onEdit: (pet) {},
        value: pet.value.markings,
      ),
      _InfoData(
        title: 'Favorite activities',
        onEdit: (pet) {},
        value: pet.value.size?.toString(),
      ),
      _InfoData(
        title: 'Compactibility with other pets',
        onEdit: (pet) {},
        value: pet.value.size?.toString(),
      ),
      _InfoData(
        title: 'Behavorial issues',
        onEdit: (pet) {},
        value: pet.value.size?.toString(),
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
          'Behavorial information',
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
                  onTap: () => info.onEdit(pet),
                  title: Text(
                    info.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: info.value != null
                      ? Text(
                          info.value!,
                          style: textStyles.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  trailing: SvgPicture.asset(
                    info.value != null ? AppIcons.edit : AppIcons.angleSmallRight,
                    height: 20,
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
  final String? value;
  final Function(ValueNotifier<Pet> param) onEdit;

  _InfoData({
    required this.title,
    required this.value,
    required this.onEdit,
  });
}
