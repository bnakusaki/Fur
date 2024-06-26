// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/providers/retrieve_breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/core/pet/presentation/interface/screens/pet_profile_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetScreen extends ConsumerWidget {
  const PetScreen({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final color = switch (pet.sex) {
      Sex.male => Colors.blue,
      Sex.female => Colors.pink,
    };

    final breed = ref.watch(retrieveBreedProvider(
      Localizations.localeOf(context).languageCode,
      pet.species,
      pet.breed,
    ));

    String parseAge(DateTime dob) {
      final now = DateTime.now();
      final years = now.difference(dob).inDays ~/ 365;
      final months = (now.difference(dob).inDays % 365) ~/ 30;
      final weeks = ((now.difference(dob).inDays % 365) % 30) ~/ 7;
      final days = ((now.difference(dob).inDays % 365) % 30) % 7;

      if (years > 0) {
        return localizations.years(years);
      } else if (months > 0) {
        return localizations.months(months);
      } else if (weeks > 0) {
        return localizations.weeks(weeks);
      } else {
        return localizations.days(days);
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(pet: pet, textStyles: textStyles),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pet.name.capitalize(),
                            style: textStyles.h1,
                          ),
                          const SizedBox(height: 5),
                          switch (breed) {
                            AsyncData(:final value) => Text(value.name.capitalize(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                )).animate().fadeIn(),
                            _ => const Text(''),
                          }
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PetProfileScreen(pet: pet),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: theme.primaryColor.withOpacity(0.1),
                        ),
                        child: Text(localizations.appButtonsViewProfile),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        Expanded(
                          child: _InfoCard(
                            color: color,
                            title: localizations.sex,
                            value: switch (pet.sex) {
                              Sex.male => localizations.male,
                              Sex.female => localizations.female,
                            },
                            icon: switch (pet.sex) {
                              Sex.male => AppIcons.male,
                              Sex.female => AppIcons.female,
                            },
                          ),
                        ),
                        Expanded(
                          child: _InfoCard(
                            color: color,
                            title: localizations.age,
                            value: parseAge(pet.dob),
                            icon: AppIcons.clock,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5000),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.color,
    required this.title,
    required this.value,
    required this.icon,
  });

  final MaterialColor color;
  final String title;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: color.shade100,
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  icon,
                  height: 20,
                  width: 20,
                  color: color,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.pet,
    required this.textStyles,
  });

  final Pet pet;
  final TextStyles textStyles;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      stretch: true,
      expandedHeight: 300,
      pinned: true,
      leading: const Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: AppBackButton(),
          ),
        ],
      ),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var isCollapsed =
              constraints.biggest.height <= kToolbarHeight + MediaQuery.of(context).padding.top;

          return FlexibleSpaceBar(
            title: isCollapsed
                ? Text(
                    pet.name.capitalize(),
                    style: textStyles.h2,
                  ).animate().fadeIn()
                : null,
            background: Image.asset(
              AppImages.authenticationScreenBg,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
