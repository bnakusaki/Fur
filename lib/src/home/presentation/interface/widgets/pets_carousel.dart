import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/interface/screens/pet_screen.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PetsCarousel extends HookConsumerWidget {
  const PetsCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final controller = usePageController();
    final page = useState(0);

    final pets = ref.watch(cachedPetsProvider);

    useEffect(() {
      Future.microtask(() async {
        while (true) {
          await Future.delayed(const Duration(seconds: 10));
          if (controller.hasClients) {
            final nextPage = (controller.page!.round() + 1) % pets.length;
            controller.animateToPage(
              nextPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        }
      });
      return;
    }, []);

    return AspectRatio(
      aspectRatio: 0.9,
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                page.value = index;
              },
              children: List.generate(pets.length, (index) {
                final pet = pets[index];
                return _Image(
                  image: pet.image,
                  index: index,
                  currentIndex: page.value,
                );
              }),
            ),
          ),
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: TextButton(
              onPressed: () {
                ref.watch(petNotifierProvider.notifier).set(pets[page.value]);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PetScreen();
                  }),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: theme.primaryColor.withOpacity(0.5),
              ),
              child: Text(
                localizations.appButtonsViewPet,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pets[page.value].name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SmoothPageIndicator(
                  controller: controller,
                  count: pets.length,
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
  });

  final String image;
  final int index;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(
      duration: const Duration(seconds: 10),
      lowerBound: 1,
      upperBound: 1.2,
    );

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
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
      ),
    );
  }
}
