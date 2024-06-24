import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/assets/app_images.dart';

class PetsCarousel extends HookWidget {
  const PetsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentPage = useState(1);

    return AspectRatio(
      aspectRatio: 2,
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.90,
        ),
        onPageChanged: (value) {
          currentPage.value = value;
        },
        itemBuilder: (context, index) {
          final inFocus = index == currentPage.value;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              child: Stack(
                children: [
                  const Positioned.fill(
                    child: Image(
                      image: AssetImage(AppImages.authenticationScreenBg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: inFocus ? 0.8 : 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.9),
                            Colors.black,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: inFocus ? 1 : 0,
                        child: const Text(
                          'Pet name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
