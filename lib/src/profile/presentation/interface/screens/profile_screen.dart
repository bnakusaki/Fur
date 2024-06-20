// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/authentication/presentation/providers/user_notifier.dart';
import 'package:fur/src/home/presentation/interface/widgets/log_out_dialog.dart';
import 'package:fur/src/profile/presentation/interface/screens/edit_profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final theme = Theme.of(context);
    final userProfile = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(localizations.appPageTitlesProfile),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Card(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${userProfile.firstName} ${userProfile.middleName ?? userProfile.lastName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        userProfile.email,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: theme.primaryColor.withOpacity(0.1),
                          fixedSize: const Size(double.infinity, 30),
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(10),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        icon: SvgPicture.asset(
                          AppIcons.edit,
                          height: 16,
                          color: theme.primaryColor,
                        ),
                        label: Text(localizations.appButtonsEditProfile),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return LogoutDialog();
                    });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red.shade50,
                overlayColor: Colors.red.shade200,
                fixedSize: const Size(double.maxFinite, 48),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                alignment: Alignment.centerLeft,
              ),
              icon: SvgPicture.asset(
                AppIcons.signOutAlt,
                height: 16,
                color: Colors.red,
              ),
              label: Text(
                localizations.appButtonsSignOut,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
