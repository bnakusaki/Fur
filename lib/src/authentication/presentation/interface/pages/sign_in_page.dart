import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/widgets/app_elevated_button.dart';
import 'package:fur/shared/widgets/app_scaffold.dart';
import 'package:gap/gap.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AppScaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(30),
                Text(
                  'Sign in',
                  style: theme.textTheme.headlineMedium,
                ),
                const Gap(5),
                Text(
                  'Sign into fur as a pet-dog owner',
                  style: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
                const Gap(30),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const Gap(15),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const Gap(30),
                AppElevatedButton(
                  child: const Text('Let me in'),
                  onPressed: () {},
                ),
                const Gap(15),
                AppElevatedButton.icon(
                  invertColors: true,
                  icon: SvgPicture.asset(AppIcons.googleBulk32px),
                  label: const Text('Sign up with Google'),
                  onPressed: () {},
                ),
                const Gap(15),
                AppElevatedButton.icon(
                  invertColors: true,
                  icon: SvgPicture.asset(AppIcons.appleBulk32px),
                  label: const Text('Sign up with Apple'),
                  onPressed: () {},
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Sign up',
                      style: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.primary),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
