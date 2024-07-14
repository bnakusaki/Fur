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
import 'package:fur/shared/widgets/app_text_form_field.dart';
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
                const _TargetWeightCard(),
                _RecordWeightCard(theme: theme),
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

class _RecordWeightCard extends HookWidget {
  const _RecordWeightCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
    final animation = useAnimation(animationController);

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/penField.svg',
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Record',
                    style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Opacity(
                  opacity: animation, // Use the animation value directly
                  child: SvgPicture.asset(
                    'assets/icons/tally1.svg',
                    height: 50,
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TargetWeightCard extends ConsumerWidget {
  const _TargetWeightCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final pet = ref.watch(petNotifierProvider)!;

    return Card(
      color: pet.weight.target != null ? Colors.white : theme.primaryColor.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return SetTargetWeightDialog(theme: theme);
            },
          );
        },
        overlayColor: MaterialStateProperty.all(theme.primaryColor.withOpacity(0.1)),
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
                      style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
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

                    return Text(
                      'Tap to set target',
                      style: TextStyle(
                        color: theme.primaryColor,
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
    );
  }
}

class SetTargetWeightDialog extends HookWidget {
  const SetTargetWeightDialog({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final targetDate = useState<DateTime?>(null);
    final controller = useTextEditingController();
    final dateController = useTextEditingController();

    useEffect(
      () {
        if (targetDate.value != null) {
          dateController.text = DateFormat('MMM d, yyy').format(targetDate.value!);
        }
        return null;
      },
      [targetDate.value],
    );

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenHorizontalPadding,
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // Set resizeToAvoidBottomInset to true
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 20,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Set target weight',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text('Target weight', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            AppTextFormField(
              controller: controller,
              hintText: 'Enter weight',
            ),
            const SizedBox(height: 20),
            Text('Target date', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            AppTextFormField(
              controller: dateController,
              hintText: 'Pick date',
              readOnly: true,
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now().add(const Duration(days: 1)),
                  lastDate: DateTime(DateTime.now().year + 1000),
                );

                if (date != null) {
                  targetDate.value = date;
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Set target'),
            )
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