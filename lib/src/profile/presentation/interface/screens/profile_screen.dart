import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/widgets/app_back_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentUser = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: const Text('Profile'),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentUser.displayName ?? 'User name',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      currentUser.email!,
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
                      onPressed: () {},
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
                      label: const Text('Edit profile'),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
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
              label: const Text(
                'Log out',
                style: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {},
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
                AppIcons.trash,
                height: 16,
                color: Colors.red,
              ),
              label: const Text(
                'Delete account',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
