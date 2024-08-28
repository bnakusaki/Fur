import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/src/authentication/presentation/interface/pages/email_auth_page.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:fur/src/onboarding/presentation/interface/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  // Gemini.init(apiKey: 'AIzaSyCzL0UWhBTVzvoqiMWjlqlRYpS42WanzFo');
  // sl<OnboardingBloc>().setOnboardingStatus(OnboardingStatus.notStarted);

  Logger().d('Supabase URL: ${const String.fromEnvironment('SUPABASE_URL')}');
  Logger().d('Supabase Anon Key: ${const String.fromEnvironment('SUPABASE_ANON_KEY')}');

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  // flutter run --dart-define=SUPABASE_URL=https://ifaerfxnbvacoxmykjxi.supabase.co --dart-define=SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlmYWVyZnhuYnZhY294bXlranhpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM4MzU5NTcsImV4cCI6MjAzOTQxMTk1N30.exexX0KcYfgJzOOl_4_2NbiKat1YTKfOlvrTYUiMDV0

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
    final noUser = Supabase.instance.client.auth.currentUser == null;

    /// If there is a user, redirect to the home screen
    if (!noUser) completer.complete('/');

    sl<OnboardingBloc>().getOnboardingStatus().then((onboardingStatus) {
      onboardingStatus.fold(
        (failure) {
          if (kDebugMode) Logger().e('Failed to get user onboarding status: $failure');
          completer.complete('/onboarding');
        },
        (status) {
          if (kDebugMode) Logger().d('User onboarding status: $status');
          switch (status) {
            case OnboardingStatus.notStarted:
              completer.complete('/onboarding');
              break;
            case OnboardingStatus.completed:
              completer.complete('/email-auth');
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
      path: '/email-auth',
      builder: (context, state) => EmailAuthPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
  ],
);
