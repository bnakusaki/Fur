import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fur/src/authentication/presentation/interface/screens/authentication_screen.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final localizations = AppLocalizations.of(context)!;

    final currentUser = FirebaseAuth.instance.currentUser;
    // final hasProfile = ref.watch(retrieveHasProfileProvider(currentUser?.uid ?? ''));

    return currentUser == null ? AuthenticationScreen() : const HomeScreen();
  }
}
