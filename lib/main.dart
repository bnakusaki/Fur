import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fur/firebase_options.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:fur/src/onboarding/presentation/interface/screens/onboarding_screen.dart';
import 'package:fur/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  init();

  final onboardingStatus = await sl<OnboardingBloc>().isOnboardingCompleted();
  final isOnboardingCompleted = onboardingStatus.fold(
    (failure) => false,
    (success) => success,
  );

  runApp(
    ProviderScope(
      child: FurApp(
        isOnboardingCompleted: isOnboardingCompleted,
      ),
    ),
  );
}

class FurApp extends StatelessWidget {
  const FurApp({
    super.key,
    required this.isOnboardingCompleted,
  });
  final bool isOnboardingCompleted;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme().theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: const SelectDogAgeScreen(),
      home: isOnboardingCompleted ? const Wrapper() : OnboardingScreen(),
    );
  }
}
