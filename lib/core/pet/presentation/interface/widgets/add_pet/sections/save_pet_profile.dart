import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
import 'package:fur/shared/assets/app_animations.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:lottie/lottie.dart';

class SavePetProfile extends HookWidget with PetsMixin {
  SavePetProfile({
    super.key,
    required this.pet,
    required this.image,
  });

  final Pet pet;
  final File image;

  @override
  Widget build(BuildContext context) {
    final loading = useState(false);

    useMemoized(() async {
      loading.value = true;

      try {
        final response = await createPet(pet);
        await savePetImage(response.id, image);
      } on Failure catch (e) {
        Logger().e(e);
      } finally {
        loading.value = false;
      }

      await Future.delayed(3.seconds);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          }),
          (route) => false,
        );
      }
    });

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading.value) ...[
              const SizedBox(
                height: 30,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                ),
              ),
              const Text('Saving pet information...'),
            ],
            if (!loading.value) ...[
              LottieBuilder.asset(
                AppAnimations.confetti,
                frameRate: FrameRate.max,
                height: 200,
                repeat: false,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
