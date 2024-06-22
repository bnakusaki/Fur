import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SavePetScreen extends HookConsumerWidget {
  const SavePetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyles = Theme.of(context).extension<TextStyles>()!;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
                child: LoadingIndicator(indicatorType: Indicator.ballGridBeat),
              ),
              const SizedBox(height: 20),
              Text(
                'Saving pet profile ...',
                style: textStyles.emptyState,
              ).animate(delay: 1.seconds).fade(),
            ],
          ),
        ),
      ),
    );
  }
}
