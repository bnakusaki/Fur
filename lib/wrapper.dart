import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/src/authentication/presentation/interface/screens/sign_in_screen.dart';
import 'package:fur/src/pets/presentation/interface/screens/select_pet_screen.dart';
import 'package:fur/src/profile/providers/retrieve_has_profile.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final currentUser = FirebaseAuth.instance.currentUser;
    final hasProfile = ref.watch(retrieveHasProfileProvider(currentUser?.uid ?? ''));

    return currentUser == null
        ? SignInScreen()
        : switch (hasProfile) {
            AsyncData(:final value) => value ? const Placeholder() : const SelectPetScreen(),
            AsyncError(:final error as Failure) => Builder(builder: (context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  AppSnackBar.error(context, error.code);
                });

                return SignInScreen();
              }),
            _ => Scaffold(
                  body: SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // TODO: app logo
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: const LinearProgressIndicator(),
                      ),
                      const SizedBox(height: 10),
                      Text(localizations.justAMoment),
                    ],
                  ),
                ),
              ))
          };
  }
}
