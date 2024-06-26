// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileScreen extends HookConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final user = FirebaseAuth.instance.currentUser!;

    final email = useState(user.email!);
    final name = useState(user.displayName!);

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final editableProfileFields = <EditableProfileFieldData>[
      EditableProfileFieldData(
        label: localizations.appTextFieldHintsEmail,
        value: email,
        icon: AppIcons.envelope,
        readOnly: true,
      ),
      EditableProfileFieldData(
        label: localizations.appTextFieldHintsName,
        value: name,
        readOnly: true,
        validator: (value) {
          if (value!.isEmpty) {
            return localizations.appTextFieldHintsName;
          }
          return null;
        },
      ),
    ];

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const Row(
            children: [
              AppBackButton(),
            ],
          ),
          title: Text(localizations.appPageTitlesEditProfile).animate().fadeIn(),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
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
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.displayName!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
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
                              fontSize: 12,
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
                          ).animate().fadeIn(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Form(
                key: formKey,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final field = editableProfileFields[index];

                    return AppTextFormField(
                        labelText: field.label,
                        initialValue: field.value.value,
                        readOnly: field.readOnly,
                        validator: field.validator,
                        prefixIcon: field.icon != null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: SvgPicture.asset(
                                  field.icon!,
                                  height: 20,
                                  color: Colors.grey,
                                ),
                              )
                            : null,
                        onChanged: (value) {
                          field.value.value = value!.trim();
                        }).animate().fadeIn();
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: editableProfileFields.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditableProfileFieldData {
  final String label;
  final ValueNotifier<String> value;
  final String? icon;
  final bool readOnly;
  final String? Function(String?)? validator;

  const EditableProfileFieldData({
    required this.label,
    required this.value,
    this.icon,
    this.readOnly = false,
    this.validator,
  });
}
