import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/interface/screens/add_pet_screen.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyPetsCarouselEmptyState extends HookWidget {
  const MyPetsCarouselEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final images = [
      AppImages.dog,
      AppImages.dog2,
    ];

    final controller = usePageController();
    final page = useState(0);

    return AspectRatio(
      aspectRatio: 0.9,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                page.value = index;
              },
              itemBuilder: (context, index) {
                final image = images[index % images.length];

                return _Image(
                  image: image,
                  index: index,
                  currentIndex: page.value,
                  pageController: controller,
                );
              },
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppPetScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: theme.primaryColor.withOpacity(0.1),
              ),
              child: Text(localizations.appButtonsAddPet),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localizations.youHaveNoPets,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SmoothPageIndicator(
                  controller: controller,
                  count: images.length,
                  effect: ExpandingDotsEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: theme.primaryColor,
                    dotColor: theme.highlightColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends HookWidget {
  const _Image({
    required this.image,
    required this.index,
    required this.currentIndex,
    required this.pageController,
  });

  final String image;
  final int index;
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(
      duration: const Duration(seconds: 10),
      lowerBound: 1,
      upperBound: 1.2,
    );

    // when animation is done, go to the next page
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });

    useEffect(
      () {
        if (index == currentIndex) {
          animation.forward();
        } else {
          animation.reverse();
        }
        return null;
      },
      [currentIndex],
    );

    return ScaleTransition(
      scale: animation,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
