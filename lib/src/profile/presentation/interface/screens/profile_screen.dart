// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/src/home/presentation/interface/widgets/log_out_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
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
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CachedNetworkImage(
                        imageUrl: user.photoURL!,
                        errorWidget: (context, url, error) => CircleAvatar(
                          child: SvgPicture.asset(
                            AppIcons.user,
                            height: 50,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.displayName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          user.email!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red.shade50,
                            overlayColor: Colors.red.shade200,
                            fixedSize: const Size(double.infinity, 30),
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
                          label: Text(
                            localizations.appButtonsDelete,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
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
