import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/routes.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/widgets/app_elevated_button.dart';
import 'package:fur/shared/widgets/app_smooth_indicator.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_message.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageController = usePageController();

    /// The current page of the [PageView].
    /// This is used to update the [AppSmoothIndicator] when the page changes.
    final currentPage = useState(0.0);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((timer) {
        pageController.addListener(() {
          if (pageController.hasClients) {
            /// Update the [currentPage] value when the [PageView] page changes.
            /// This will update the [AppSmoothIndicator] to reflect the current page.
            currentPage.value = pageController.page ?? currentPage.value;
          }
        });
      });

      return () => pageController.dispose();
    }, [pageController]);

    final onboardingMessages = <OnboardingMessage>[
      OnboardingMessage(
        title: 'Take great care of your pet',
        description: 'with our in app tools, no expertise needed.',
        // description: '',
        image: AppImages.pet,
      ),
      OnboardingMessage(
        title: 'Stay on top of important dates',
        description: 'with in-app reminders and easy schedule management tools.',
        image: AppImages.bell,
      ),
      OnboardingMessage(
        title: 'Health and development tracker',
        description: 'with our user-friendly tools.',
        image: AppImages.medicalReport,
      ),
      OnboardingMessage(
        title: 'FUR',
        description: 'The important things in life are not things. They are pets.',
        image: '',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppSmoothIndicator(
                offset: currentPage.value,
                count: onboardingMessages.length,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: onboardingMessages
                        .map(
                          (message) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Center(
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: message.title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                          TextSpan(text: '\n${message.description}'),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.surface),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: AppElevatedButton(
                    child: const Text('Sign up'),
                    onPressed: () => context.goNamed(Routes.signUp),
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: () => context.goNamed(Routes.signIn),
                      child: Text(
                        'Sign in',
                        style: theme.textTheme.titleSmall!.copyWith(color: Colors.white),
                      ),
                    )
                  ],
                ),
                const Gap(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
