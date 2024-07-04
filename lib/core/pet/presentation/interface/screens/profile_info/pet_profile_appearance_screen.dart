import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/interface/screens/edit_pet_info/edit_pet_markings_dialog.dart';
import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetProfileAppearanceScreen extends HookConsumerWidget with PetsMixin {
  PetProfileAppearanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final pet = ref.watch(petNotifierProvider)!;

    var infos = <_InfoData>[
      _InfoData(
        title: localizations.color,
        icon: AppIcons.palette,
        onEdit: () {},
        value: pet.color,
      ),
      _InfoData(
        title: localizations.markings,
        icon: AppIcons.clawMarks,
        onEdit: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return EditPetMarkingsDialog();
            },
          );
        },
        value: pet.markings,
      ),
      _InfoData(
        title: localizations.size,
        icon: AppIcons.sortSizeUp,
        onEdit: () {},
        value: pet.size?.toString(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.appPageTitlesAppearance,
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
                  onTap: info.onEdit,
                  leading: SvgPicture.asset(info.icon),
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
  final Function() onEdit;
  final String icon;

  _InfoData({
    required this.title,
    required this.value,
    required this.onEdit,
    required this.icon,
  });
}
