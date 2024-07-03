// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/interface/screens/pet_profile_screen.dart';
import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
import 'package:fur/core/pet/presentation/providers/retrieve_breed.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PetScreen extends HookConsumerWidget with PetsMixin {
  PetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final pet = ref.watch(petNotifierProvider)!;

    final color = switch (pet.sex) {
      Sex.male => Colors.blue,
      Sex.female => Colors.pink,
    };

    final breed = ref.watch(retrieveBreedProvider(
      Localizations.localeOf(context).languageCode,
      pet.breed,
      pet.species,
    ));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(pet: pet),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // const SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             pet.name.capitalize(),
                //             style: textStyles.h1,
                //           ),
                //           const SizedBox(height: 5),
                //           switch (breed) {
                //             AsyncData(:final value) => Text(value.name.capitalize(),
                //                 style: const TextStyle(
                //                   fontWeight: FontWeight.w500,
                //                 )).animate().fadeIn(),
                //             _ => const Text(''),
                //           }
                //         ],
                //       ),
                //       TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => const PetProfileScreen(),
                //             ),
                //           );
                //         },
                //         style: TextButton.styleFrom(
                //           backgroundColor: theme.primaryColor.withOpacity(0.1),
                //         ),
                //         child: Text(localizations.appButtonsViewProfile),
                //       )
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                //   child: SizedBox(
                //     height: 65,
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: _InfoCard(
                //             color: color,
                //             title: localizations.sex,
                //             value: switch (pet.sex) {
                //               Sex.male => localizations.male,
                //               Sex.female => localizations.female,
                //             },
                //             icon: switch (pet.sex) {
                //               Sex.male => AppIcons.male,
                //               Sex.female => AppIcons.female,
                //             },
                //           ),
                //         ),
                //         const SizedBox(width: 10),
                //         Expanded(
                //           child: _InfoCard(
                //             color: color,
                //             title: localizations.age,
                //             value: parseAge(pet.dob, localizations),
                //             icon: AppIcons.clock,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(height: 3000),
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
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return SliverAppBar(
      backgroundColor: Colors.white,
      stretch: true,
      expandedHeight:
          (MediaQuery.sizeOf(context).width - AppSizes.screenHorizontalPadding * 2) * (1 / 0.9) +
              MediaQuery.of(context).padding.top,
      pinned: true,
      leading: const BackButton(),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var isCollapsed =
              constraints.biggest.height <= kToolbarHeight + MediaQuery.of(context).padding.top;

          return FlexibleSpaceBar(
            title: isCollapsed
                ? Text(
                    pet.name.capitalize(),
                    // style: textStyles.h2,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn()
                : null,
            background: SafeArea(
              minimum: EdgeInsets.only(top: kToolbarHeight + MediaQuery.of(context).padding.top),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                child: AspectRatio(
                  aspectRatio: 0.9,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          imageUrl: pet.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.5),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const PetProfileScreen();
                              }),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: theme.primaryColor.withOpacity(0.5),
                          ),
                          child: const Text(
                            'View profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pet.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
