// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/pet/presentation/interface/screens/input_pet_name_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/src/home/presentation/interface/widgets/log_out_dialog.dart';
import 'package:fur/src/profile/presentation/interface/screens/profile_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final theme = Theme.of(context);

    final currentUser = FirebaseAuth.instance.currentUser!;

    return Drawer(
      elevation: 0.0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              splashColor: theme.primaryColor.withOpacity(0.1),
              tileColor: theme.primaryColor.withOpacity(0.1),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10),
              ),
              leading: const CircleAvatar(),
              title: Text(
                currentUser.displayName!,
                style: const TextStyle(fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                currentUser.email!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pets',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputPetNameScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                backgroundColor: theme.primaryColor.withOpacity(0.1),
                fixedSize: const Size(double.maxFinite, 48),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                alignment: Alignment.centerLeft,
              ),
              icon: SvgPicture.asset(
                AppIcons.plus,
                height: 16,
                color: theme.primaryColor,
              ),
              label: Text(localizations.appButtonsAddPet),
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {
                showDialog(context: context, builder: (context) => LogoutDialog());
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
