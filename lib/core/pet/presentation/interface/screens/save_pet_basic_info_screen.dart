// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SavePetBasicInfoScreen extends HookConsumerWidget with PetsMixin {
  SavePetBasicInfoScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final textStyles = Theme.of(context).extension<TextStyles>()!;

    useMemoized(() async {
      try {
        // await createPet(pet.copyWith(owner: FirebaseAuth.instance.currentUser!.uid));
        ref.watch(cachedPetsProvider.notifier).add(pet);

        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      } on Failure catch (e) {
        if (context.mounted) {
          AppSnackBar.error(context, e.code);
        }
      }
    });

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
                localizations.savingPetInfo,
                style: textStyles.emptyState,
              ).animate(delay: 1.seconds).fade(),
            ],
          ),
        ),
      ),
    );
  }
}
