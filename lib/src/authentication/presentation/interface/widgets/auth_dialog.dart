import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/routes.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/src/authentication/presentation/bloc/auth_mixin.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AuthDialog extends StatelessWidget with AuthMixin {
  AuthDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign in',
                    style: theme.textTheme.titleLarge,
                  ),
                  Card(
                    shape: const CircleBorder(),
                    color: theme.primaryColor.withOpacity(0.1),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.close,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const Gap(20),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await signInWithGoogle();
                    if (context.mounted) context.replaceNamed(Routes.home);
                  } catch (e) {
                    //TODO: handle error
                  }
                },
                label: const Text('Sign in with Google'),
                icon: SvgPicture.asset(AppIcons.googleBulk32px),
              ).withLoadingState(),
              const Gap(10),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    await Future.delayed(Durations.extralong4);
                  } catch (e) {
                    //TODO: handle error
                  }
                },
                label: const Text('Sign in with Apple'),
                icon: SvgPicture.asset(AppIcons.appleBulk32px),
              ).withLoadingState(),
            ],
          ),
        ),
      ),
    );
  }
}
