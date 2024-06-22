import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/authentication/presentation/interface/screens/sign_in_screen.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_mixin.dart';
import 'package:fur/src/onboarding/presentation/interface/widgets/done_button.dart';
import 'package:fur/src/onboarding/presentation/interface/widgets/next_button.dart';
import 'package:fur/src/onboarding/presentation/interface/widgets/smooth_page_indicator.dart';
import 'package:logger/logger.dart';

class OnboardingScreen extends HookWidget with OnboardingMixin {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final currentPage = useState(0);
    final pageController = usePageController();

    const pages = [
      _OnboardingScreen1(),
      _OnboardingScreen2(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        // App Icon
        title: currentPage.value > 0
            ? AppBackButton(
                onPressed: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeIn,
                  );
                },
              ).animate().fadeIn()
            : const Placeholder(
                fallbackHeight: 30,
              ).animate().fadeIn(),
        actions: [
          if (currentPage.value != pages.length - 1)
            TextButton(
              onPressed: () async {
                try {
                  await setOnboardingCompleted();
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                      (_) => true,
                    );
                  }
                } on Failure catch (e) {
                  if (kDebugMode) Logger().e(e);
                }
              },
              child: Text(localizations.appButtonsSkip),
            ).animate().fadeIn(),
        ],
      ),
      //
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            currentPage.value = index;
          },
          children: pages,
        ),
      ),

      //
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.paddingOf(context).bottom + 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              count: pages.length,
              value: currentPage.value,
            ),
            currentPage.value == pages.length - 1
                ? DoneButton(
                    onPressed: () async {
                      try {
                        await setOnboardingCompleted();
                        if (context.mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                            (_) => true,
                          );
                        }
                      } on Failure catch (e) {
                        if (kDebugMode) Logger().e(e);
                      }
                    },
                  ).animate().fadeIn()
                : NextButton(
                    onPressed: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeIn,
                      );
                    },
                  ).animate().fadeIn(),
          ],
        ),
      ),
    );
  }
}

class _OnboardingScreen1 extends StatelessWidget {
  const _OnboardingScreen1();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.welcomeToApp,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(localizations.onboardingMsg1),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}

class _OnboardingScreen2 extends StatelessWidget {
  const _OnboardingScreen2();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final textStyles = Theme.of(context).extension<TextStyles>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.onboardingMsg2Title,
            style: textStyles.h1,
          ),
          const SizedBox(height: 10),
          Text(localizations.onboardingMsg2),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
