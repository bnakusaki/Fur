// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';
import 'package:fur/core/pet/presentation/interface/screens/pet_profile_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/string.dart';
import 'package:fur/shared/styles/app_sizes.dart';

class PetScreenAppBar extends StatelessWidget {
  const PetScreenAppBar({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return SliverAppBar(
      backgroundColor: Colors.white,
      stretch: true,
      expandedHeight:
          (MediaQuery.sizeOf(context).width - AppSizes.screenHorizontalPadding * 2) * (0.7) +
              MediaQuery.of(context).padding.top,
      pinned: true,
      leading: const BackButton(),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var isCollapsed =
              constraints.biggest.height <= kToolbarHeight + MediaQuery.of(context).padding.top;

          return FlexibleSpaceBar(
            title: isCollapsed
                ? Text(
                    pet.name.capitalize(),
                    //
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn()
                : null,
            background: SafeArea(
              minimum: EdgeInsets.only(top: kToolbarHeight + MediaQuery.of(context).padding.top),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        width: double.maxFinite,
                        height: double.maxFinite,
                        imageUrl: pet.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
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
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const PetProfileScreen();
                            }),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: theme.primaryColor.withOpacity(0.5),
                        ),
                        child: Text(
                          localizations.appButtonsViewProfile,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      left: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                pet.name.capitalize(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 5),
                              SvgPicture.asset(
                                switch (pet.sex) {
                                  Sex.male => AppIcons.male,
                                  Sex.female => AppIcons.female,
                                },
                                height: 20,
                                color: switch (pet.sex) {
                                  Sex.male => Colors.blue,
                                  Sex.female => Colors.pink,
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
