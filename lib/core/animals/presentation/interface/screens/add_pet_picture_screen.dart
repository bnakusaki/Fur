import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/presentation/interface/screens/select_animal_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/src/profile/presentation/bloc/profile_mixin.dart';
import 'package:image_picker/image_picker.dart';

class AddPetPictureScreen extends HookWidget with ProfileMixin {
  AddPetPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final profilePicture = useState<XFile?>(null);
    final picker = ImagePicker();

    Future<void> getImage() async {
      try {
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          profilePicture.value = pickedFile;
        }
      } on Failure catch (e) {
        if (context.mounted) {
          AppSnackBar.error(context, e.code);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localizations.appPageTitlesAddPetPicture),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectAnimalScreen(),
                ),
              );
            },
            child: Text(localizations.appButtonsSkip),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade300,
                    width: 4,
                  ),
                ),
                child: profilePicture.value == null
                    ? CircleAvatar(
                        radius: (MediaQuery.of(context).size.width - 40) / 3,
                        child: SvgPicture.asset(
                          AppIcons.pawHeart,
                          height: (MediaQuery.of(context).size.width - 40) / 3,
                          width: (MediaQuery.of(context).size.width - 40) / 3,
                        ),
                      )
                    : SizedBox(
                        width: (MediaQuery.of(context).size.width - 40) * 2 / 3,
                        height: (MediaQuery.of(context).size.width - 40) * 2 / 3,
                        child: Image.file(
                          File(profilePicture.value!.path),
                          fit: BoxFit.cover,
                        ).animate().fadeIn(),
                      ),
              ).animate().scaleXY(begin: 0.90),
              const SizedBox(height: 10),
              TextButton(
                onPressed: getImage,
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                child: profilePicture.value == null
                    ? Text(localizations.appButtonsAddPicture).animate().fadeIn()
                    : Text(localizations.appButtonsChangePicture).animate().fadeIn(),
              )
            ],
          ),
        ),
      ),
      bottomSheet: profilePicture.value != null
          ? Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).padding.bottom + 20,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(localizations.appButtonsNext),
              ).withLoadingState(onPressed: () async {
                try {
                  // await addProfilePicture(
                  //   profilePicture.value!.path,
                  //   FirebaseAuth.instance.currentUser!.uid,
                  // );

                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectAnimalScreen(),
                      ),
                    );
                  }
                } on Failure catch (e) {
                  if (context.mounted) {
                    AppSnackBar.error(context, e.code);
                  }
                }
              }),
            ).animate().fadeIn().slideY(begin: 0.1)
          : null,
    );
  }
}
