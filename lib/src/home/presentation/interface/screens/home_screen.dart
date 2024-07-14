import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/core/pet/presentation/interface/widgets/my_pets_carousel.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/src/home/presentation/interface/widgets/app_drawer.dart';
import 'package:fur/src/home/presentation/interface/widgets/menu_button.dart';
import 'package:fur/src/notifications/presentation/interface/widgets/notifications_button.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuAnimationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    return Scaffold(
      onDrawerChanged: (isOpened) {
        if (!isOpened) {
          menuAnimationController.reverse();
        } else {
          menuAnimationController.forward();
        }
      },
      appBar: AppBar(
        leading: MenuButton(animationController: menuAnimationController),
        actions: const [
          NotificationsButton(),
          SizedBox(width: 10),
        ],
      ),
      drawer: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19.0),
          child: AppDrawer(),
        ),
      ),
      body: const SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            MyPetsCarousel(),
          ],
        ),
      ),
    );
  }
}
