import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_name_screen.dart';
import 'package:fur/core/pet/presentation/interface/screens/pet_screen.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/core/pet/presentation/providers/list_pets.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class PetsCarousel extends HookConsumerWidget {
  const PetsCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;
    final currentPage = useState(0);

    final pets = ref.watch(listPetsProvider(FirebaseAuth.instance.currentUser!.uid));
    final cachedPets = ref.watch(cachedPetsProvider);

    return switch (pets) {
      AsyncData(:final value) => value.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.myPets,
                        style: textStyles.h2,
                      ),
                      IconButton.filledTonal(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InputPetNameScreen(),
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          AppIcons.plus,
                          height: 16,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                AspectRatio(
                  aspectRatio: 2,
                  child: _Carousel(currentPage: currentPage, value: cachedPets),
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InputPetNameScreen(),
                    ),
                  );
                },
                tileColor: theme.primaryColor.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  localizations.youHaveNoPets,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(localizations.tapToAddYourFirstPet),
                trailing: SvgPicture.asset(
                  AppIcons.angleSmallRight,
                  height: 20,
                ),
              ),
            ),
      _ => AspectRatio(
          aspectRatio: 2,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.90,
            ),
            onPageChanged: (value) {
              currentPage.value = value;
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200,
                  highlightColor: Colors.grey.shade100,
                  child: const Card(),
                ),
              );
            },
            itemCount: 2,
          ),
        ),
    };
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({
    required this.currentPage,
    required this.value,
  });

  final ValueNotifier<int> currentPage;
  final List<Pet> value;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(
        viewportFraction: 0.90,
      ),
      onPageChanged: (value) {
        currentPage.value = value;
      },
      itemBuilder: (context, index) {
        final inFocus = index == currentPage.value;
        final pet = value[index];

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: value.length > 1 ? 5 : 0),
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
                      child: Text(
                        pet.name,
                        style: const TextStyle(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetScreen(pet: pet),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: value.length,
    );
  }
}
