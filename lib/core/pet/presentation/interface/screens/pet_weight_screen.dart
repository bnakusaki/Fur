// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class PetWeightScreen extends HookConsumerWidget with PetsMixin {
  PetWeightScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final pet = ref.watch(petNotifierProvider)!;

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
      initialValue: 1,
      lowerBound: 0,
    )..repeat(reverse: true);

    // final cards = <_CardData>[
    //   _CardData(
    //     icon: AppIcons.gym,
    //     title: 'Weight',
    //     value: ,
    //     tag: 'At: ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
    //   ),
    //   _CardData(
    //     icon: AppIcons.locationCrosshairs,
    //     title: 'Target',
    //     value: '60.5 kg',
    //     tag: 'By: ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
    //   ),
    //   _CardData(
    //     icon: AppIcons.timePast,
    //     title: 'History',
    //     value: '5.6 kg',
    //     tag: 'First weight: ${DateFormat('MMM yyy').format(DateTime.now())}',
    //   ),
    //   _CardData(
    //     icon: AppIcons.arrowComparison,
    //     title: 'Trend',
    //     value: 'Stable',
    //     tag: 'Since: ${DateFormat('MMM yyy').format(DateTime.now())}',
    //   ),
    // ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            GridView.count(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: [
                _PetWeightCard(),
                Card(
                  color: pet.weight.target != null ? Colors.white : Colors.blue.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.locationCrosshairs,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Target',
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Center(
                            child: Builder(builder: (context) {
                              final target = pet.weight.target;

                              if (target != null) {
                                return Text(
                                  target.target.toString(),
                                  style: textStyles.h1,
                                );
                              }

                              return const Text(
                                'Tap to set target',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                          ),
                        ),
                        pet.weight.target != null
                            ? Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  DateFormat('MMM d, yyy').format(DateTime.now()),
                                  style: textStyles.caption,
                                ),
                              )
                            : Text(
                                '',
                                style: textStyles.caption,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            // Text(
            //   'Weight history',
            //   style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
            // ),
            // const SizedBox(height: 10),

            // Text(
            //   'Current weight',
            //   style: theme.textTheme.titleMedium,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //   child: Text(
            //     '20.6 kg',
            //     style: textStyles.h1,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _PetWeightCard extends ConsumerWidget with PetsMixin {
  _PetWeightCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final pet = ref.watch(petNotifierProvider)!;

    final sortedWeightHistory = sortWeightHistory(pet.weight.history);

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppIcons.gym,
                  height: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Weight',
                    style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  localizations.weightInKg(sortedWeightHistory.values.last),
                  style: textStyles.h1,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat('MMM d, yyy').format(sortedWeightHistory.keys.last),
                style: textStyles.caption,
              ),
            )
          ],
        ),
      ),
    );
  }
}



//  Card(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               AppIcons.edit,
//                               height: 20,
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Text(
//                                 'Record weight',
//                                 style: theme.textTheme.titleMedium!
//                                     .copyWith(fontWeight: FontWeight.w600),
//                                 maxLines: 1,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Expanded(
//                           child: Center(
//                             child: FadeTransition(
//                               opacity: animationController,
//                               child: SvgPicture.asset(
//                                 AppIcons.pointerText,
//                                 height: 50,
//                                 color: theme.primaryColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),