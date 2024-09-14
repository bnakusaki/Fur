import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_message.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingMessageCard extends HookWidget {
  const OnboardingMessageCard({
    super.key,
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
                        style: theme.textTheme.titleLarge,
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
              _ActionButton(
                onLastPage: onLastPage,
                pageController: pageController,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _ActionButton extends HookWidget {
  const _ActionButton({
    required this.onLastPage,
    required this.pageController,
  });

  final bool onLastPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
      initialValue: 1,
    );
    final onLastPage = useState(this.onLastPage);

    useMemoized(
      () async {
        await animationController.reverse();
        onLastPage.value = this.onLastPage;
        await animationController.forward();
        return null;
      },
      [this.onLastPage],
    );

    return ElevatedButton(
      onPressed: () async {
        if (!this.onLastPage) {
          // Move to the next page
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        } else {
          final bloc = sl<OnboardingBloc>();
          await bloc.setOnboardingStatus(OnboardingStatus.completed);
          if (context.mounted) {
            context.goNamed('auth-dialog');
          }
        }
      },
      child: FadeTransition(
        opacity: animationController,
        child: Text(
          onLastPage.value ? 'Sign in' : 'Next',
        ),
      ),
    ).withLoadingState();
  }
}
