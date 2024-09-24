import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fur/core/user/presentation/interface/pages/profile_setup_page.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/routes.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/src/authentication/presentation/interface/pages/sign_in_page.dart';
import 'package:fur/src/authentication/presentation/interface/pages/sign_up_page.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';
import 'package:fur/src/onboarding/presentation/interface/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// flutter run --dart-define-from-file=secrets.json
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize dependencies.
  init();

  runApp(
    const ProviderScope(
      child: FurApp(),
    ),
  );
}

class FurApp extends StatelessWidget {
  const FurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme().theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}

/// GoRouter configuration
final _router = GoRouter(
  redirect: (context, state) {
    // final completer = Completer<String?>();

    /// If there is a user, redirect to the home screen,
    /// else redirect to the onboarding screen
    // if (!noUser) completer.complete('/');
    // if (!noUser) return '/';
    // if (!noUser) return '/profile_setup';
    return null;
    // return '/onboarding';

    // sl<OnboardingBloc>().getOnboardingStatus().then((onboardingStatus) {
    //   onboardingStatus.fold(
    //     (failure) {
    //       if (kDebugMode) Logger().e('Failed to get user onboarding status: $failure');
    //       completer.complete('/onboarding');
    //     },
    //     (status) {
    //       if (kDebugMode) Logger().d('User onboarding status: $status');
    //       switch (status) {
    //         case OnboardingStatus.notStarted:
    //           completer.complete('/onboarding');
    //           break;
    //         default:
    //           completer.complete('/onboarding/auth_dialog');
    //           break;
    //         // case OnboardingStatus.completed:
    //         //   completer.complete('/onboarding/auth_dialog');
    //         //   break;
    //       }
    //     },
    //   );
    // });

    // return completer.future;
  },
  initialLocation: '/onboarding',

  /// Route definition
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: Routes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'profile_setup',
          name: Routes.profileSetup,
          builder: (context, state) => const ProfileSetupPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/onboarding',
      name: Routes.onboarding,
      builder: (context, state) => const OnboardingPage(),
      routes: [
        GoRoute(
          path: 'sign_up',
          name: Routes.signUp,
          builder: (context, state) => SignUpPage(),
        ),
        GoRoute(
          path: 'sign_in',
          name: Routes.signIn,
          builder: (context, state) => const SignInPage(),
        ),
        // GoRoute(
        //   path: 'auth_dialog',
        //   name: Routes.authDialog,
        //   pageBuilder: (context, state) => DialogPage(
        //     anchorPoint: const Offset(0.5, 1.0),
        //     builder: (_) => AuthDialog(),
        //   ),
        // ),
      ],
    ),
  ],
);
