import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/src/authentication/presentation/providers/user_notifier.dart';
import 'package:fur/src/home/presentation/interface/widgets/app_drawer.dart';
import 'package:fur/src/profile/providers/retrieve_profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuAnimationController =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    useMemoized(() async {
      try {
        final uid = FirebaseAuth.instance.currentUser!.uid;
        final response = await ref.watch(retrieveProfileProvider(uid).future);

        debugPrint(response.toString());
        ref.watch(userNotifierProvider.notifier).set(response);
      } catch (e) {
        debugPrint('=============');
        debugPrint(e.toString());

        ///
      }
    });

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
    );
  }
}
