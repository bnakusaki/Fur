import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fur/firebase_options.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  init();

  Gemini.init(apiKey: 'AIzaSyCzL0UWhBTVzvoqiMWjlqlRYpS42WanzFo');

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme().theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Wrapper(),
    );
  }
}
