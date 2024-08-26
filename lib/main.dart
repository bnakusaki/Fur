import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:fur/src/onboarding/presentation/interface/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  // Gemini.init(apiKey: 'AIzaSyCzL0UWhBTVzvoqiMWjlqlRYpS42WanzFo');

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
    final completer = Completer<String?>();

    sl<OnboardingBloc>().getOnboardingStatus().then((onboardingStatus) {
      onboardingStatus.fold(
        (failure) => completer.complete('/onboarding'),
        (status) {
          if (kDebugMode) Logger().d('User onboarding status: $status');
          switch (status) {
            case OnboardingStatus.notStarted:
              completer.complete('/onboarding');
              break;
            case OnboardingStatus.completed:
              completer.complete('/');
              break;
          }
        },
      );
    });

    return completer.future;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
