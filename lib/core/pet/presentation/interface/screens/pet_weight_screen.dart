import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:intl/intl.dart';

class PetWeightScreen extends HookWidget {
  const PetWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
      initialValue: 1,
      lowerBound: 0,
    )..repeat(reverse: true);

    final cards = <_CardData>[
      _CardData(
        icon: AppIcons.gym,
        title: 'Weight',
        value: '20.6 kg',
        tag: 'At: ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
      ),
      _CardData(
        icon: AppIcons.locationCrosshairs,
        title: 'Target',
        value: '60.5 kg',
        tag: 'By: ${DateFormat('MMM d, yyyy').format(DateTime.now())}',
      ),
      _CardData(
        icon: AppIcons.timePast,
        title: 'History',
        value: '5.6 kg',
        tag: 'First weight: ${DateFormat('MMM yyy').format(DateTime.now())}',
      ),
      _CardData(
        icon: AppIcons.arrowComparison,
        title: 'Trend',
        value: 'Stable',
        tag: 'Since: ${DateFormat('MMM yyy').format(DateTime.now())}',
      ),
    ];

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
                ...cards.map((element) => _Card(data: element)),
                Card(
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
                              AppIcons.edit,
                              height: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Record weight',
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontWeight: FontWeight.w600),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Center(
                            child: FadeTransition(
                              opacity: animationController,
                              child: SvgPicture.asset(
                                AppIcons.pointerText,
                                height: 50,
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
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

class _Card extends StatelessWidget {
  const _Card({required this.data});

  final _CardData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

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
                  data.icon,
                  height: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    data.title,
                    style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  data.value,
                  style: textStyles.h1,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                data.tag,
                style: textStyles.caption,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardData {
  final String icon;
  final String title;
  final String value;
  final String tag;

  _CardData({
    required this.icon,
    required this.title,
    required this.value,
    required this.tag,
  });
}
