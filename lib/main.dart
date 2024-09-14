import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/routes.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/shared/widgets/dialog_page.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/auth_dialog.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';
import 'package:fur/src/onboarding/presentation/interface/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// flutter run --dart-define-from-file=secrets.json
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize dependencies.
  init();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_PROJECT_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

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
    final noUser = Supabase.instance.client.auth.currentUser == null;

    /// If there is a user, redirect to the home screen,
    /// else redirect to the onboarding screen
    // if (!noUser) completer.complete('/');
    if (!noUser) return '/';
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
    ),
    GoRoute(
      path: '/onboarding',
      name: Routes.onboarding,
      builder: (context, state) => const OnboardingPage(),
      routes: [
        GoRoute(
          path: 'auth_dialog',
          name: Routes.authDialog,
          pageBuilder: (context, state) => DialogPage(
            anchorPoint: const Offset(0.5, 1.0),
            builder: (_) => AuthDialog(),
          ),
        ),
      ],
    ),
  ],
);
