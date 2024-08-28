import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/widgets/app_smooth_indicator.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_message.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
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
        title: 'Pet-care made easy',
        description:
            'Take great care of your pet effortlessly with our in app tools, no expertise needed.',
        // description: '',
        image: AppImages.pet,
      ),
      OnboardingMessage(
        title: 'Remember important schedules',
        description:
            'Stay on top of important dates with in-app reminders and easy schedule management tools.',
        image: AppImages.bell,
      ),
      OnboardingMessage(
        title: 'Health and development tracker',
        description:
            'Effortlessly track your pet\'s health and growth with our user-friendly tools.',
        image: AppImages.medicalReport,
      ),
      OnboardingMessage(
        title: 'FUR',
        description: 'The important things in life are not things. They are pets.',
        image: '',
      ),
    ];

    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      children: onboardingMessages
                          .map(
                            (onboardingMessage) => Center(
                              child: Image.asset(
                                onboardingMessage.image,
                                height: 300,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1.3,
                    child: _OnboardingMessageCard(
                      currentPage: currentPage,
                      onboardingMessages: onboardingMessages,
                      pageController: pageController,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSmoothIndicator(
                    offset: currentPage.value,
                    count: onboardingMessages.length,
                  ),
                  Visibility(
                    visible: currentPage.value.round() != onboardingMessages.length - 1,
                    replacement: const SizedBox(height: 48),
                    child: TextButton(
                      onPressed: () {
                        pageController.animateToPage(
                          onboardingMessages.length - 1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Skip'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingMessageCard extends HookWidget {
  const _OnboardingMessageCard({
    required this.currentPage,
    required this.onboardingMessages,
    required this.pageController,
  });

  final ValueNotifier<double> currentPage;
  final List<OnboardingMessage> onboardingMessages;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    /// Controls the animation of message displayed on the onboarding page.
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
      initialValue: 1,
    );

    useMemoized(
      () async {
        await animationController.reverse();
        // await Future.delayed(const Duration(milliseconds: 0));
        await animationController.forward();
      },
      [currentPage.value.round()],
    );

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Builder(builder: (context) {
          final onLastPage = currentPage.value.round() >= onboardingMessages.length - 1;
          final message = onboardingMessages[currentPage.value.round()];

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ScaleTransition(
                  scale: animationController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message.title,
                        style: theme.textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        message.description,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (!onLastPage) {
                    // Move to the next page
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // TODO: Move to auth page
                    final bloc = sl<OnboardingBloc>();
                    await bloc.setOnboardingStatus(OnboardingStatus.completed);
                    if (context.mounted) {
                      context.replace('email-auth');
                      // Navigator.of(context).pushReplacementNamed('/');
                    }
                  }
                },
                child: Text(onLastPage ? 'Sign in' : 'Next'),
              ).withLoadingState(),
            ],
          );
        }),
      ),
    );
  }
}
