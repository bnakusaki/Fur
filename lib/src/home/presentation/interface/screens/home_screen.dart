import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/core/pet/presentation/providers/list_pets.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/src/home/presentation/interface/widgets/app_drawer.dart';
import 'package:fur/src/home/presentation/interface/widgets/no_pets_carousel.dart';
import 'package:fur/src/home/presentation/interface/widgets/pets_carousel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final menuAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );

    ref.watch(listPetsProvider(FirebaseAuth.instance.currentUser!.uid));
    final pets = ref.watch(cachedPetsProvider);

    return Scaffold(
      onDrawerChanged: (isOpened) {
        if (!isOpened) {
          menuAnimationController.reverse();
        } else {
          menuAnimationController.forward();
        }
      },
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: LottieBuilder.asset(
              controller: menuAnimationController,
              AppAnimatedIcons.menuV2,
              frameRate: FrameRate.max,
            ),
          );
        }),
      ),
      drawer: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.0),
          child: AppDrawer(),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Builder(
              builder: (context) {
                if (pets.isNotEmpty) {
                  return const PetsCarousel();
                }
                return const NoPetsCarousel();
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Reminders',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const AspectRatio(
                    aspectRatio: 0.9,
                    child: Card(
                      color: Colors.red,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
