// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_mixin.dart';

import '../../../../../common_libs.dart';

class AuthenticationScreen extends HookWidget with AuthenticationMixin {
  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final authenticationOptions = <_AutneticationOptionData>[
      if (Platform.isIOS)
        _AutneticationOptionData(
          label: localizations.appButtonsContinueWithApple,
          icon: AppIcons.apple,
          onPressed: () async {
            try {
              await authenticateWithApple(context);
            } on Failure catch (e) {
              if (context.mounted) {
                AppSnackBar.error(context, e.code);
              }
            }
          },
        ),
      _AutneticationOptionData(
        label: localizations.appButtonsContinueWithGoogle,
        icon: AppIcons.google,
        onPressed: () async {
          try {
            await authenticateWithGoogle(context);
          } on Failure catch (e) {
            if (context.mounted) {
              AppSnackBar.error(context, e.code);
            }
          }
        },
      ),
      _AutneticationOptionData(
        label: localizations.appButtonsContinueWithFacebook,
        icon: AppIcons.facebook,
        onPressed: () async {
          try {
            await authenticateWithFacebook(context);
          } on Failure catch (e) {
            if (context.mounted) {
              AppSnackBar.error(context, e.code);
            }
          }
        },
      ),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.authenticationScreenBg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
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
                  Colors.black.withOpacity(1.0),
                ],
              ),
            ),
          ),
          SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ...[
                  Text(
                    localizations.appTitle,
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    localizations.petcareMadeEasy,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    localizations.petOwners,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    localizations.petSitters,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    localizations.veterinarians,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ].animate(interval: 500.milliseconds).fadeIn().fadeOut(delay: 8000.milliseconds),
                const Spacer(),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (context, index) {
                    final authenticationOption = authenticationOptions[index];

                    return ElevatedButton.icon(
                      onPressed: null,
                      label: Text(authenticationOption.label),
                      icon: SvgPicture.asset(
                        authenticationOption.icon,
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      ),
                    ).withLoadingState(onPressed: authenticationOption.onPressed);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: authenticationOptions.length,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.paddingOf(context).bottom + 20,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              localizations.appButtonsTermsAndConditions,
              style: textStyles.link,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _AutneticationOptionData {
  final String label;
  final String icon;
  final Future<void> Function() onPressed;

  _AutneticationOptionData({
    required this.label,
    required this.icon,
    required this.onPressed,
  });
}
