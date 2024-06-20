// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';
import 'package:fur/src/authentication/presentation/providers/user_notifier.dart';
import 'package:fur/src/profile/presentation/bloc/profile_mixin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileScreen extends HookConsumerWidget with ProfileMixin {
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final userProfile = ref.watch(userNotifierProvider);

    final email = useState(userProfile.email);
    final firstName = useState(userProfile.firstName);
    final middleName = useState(userProfile.middleName ?? '');
    final lastName = useState(userProfile.lastName);

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final editableProfileFields = <EditableProfileFieldData>[
      EditableProfileFieldData(
          label: localizations.appTextFieldHintsEmail,
          value: email,
          icon: AppIcons.envelope,
          readOnly: true,
          validator: (value) {
            if (value!.isEmpty) {
              return localizations.appTextFieldErrorsEmptyEmail;
            } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
              return localizations.appTextFieldErrorsInvalidEmail;
            }
            return null;
          }),
      EditableProfileFieldData(
        label: localizations.appTextFieldHintsFirstName,
        value: firstName,
        validator: (value) {
          if (value!.isEmpty) {
            return localizations.appTextFieldErrorsEmptyFirstName;
          }
          return null;
        },
      ),
      EditableProfileFieldData(
        label: localizations.appTextFieldHintsMiddleName,
        value: middleName,
        validator: (value) {
          if (value!.isEmpty) {
            return localizations.appTextFieldErrorsEmptyMiddleName;
          }
          return null;
        },
      ),
      EditableProfileFieldData(
        label: localizations.appTextFieldHintsLastName,
        value: lastName,
        validator: (value) {
          if (value!.isEmpty) {
            return localizations.appTextFieldErrorsEmptyLastName;
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
          title: Text(localizations.appPageTitlesEditProfile),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
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
                        });
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                  itemCount: editableProfileFields.length,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: email.value != userProfile.email ||
                firstName.value != userProfile.firstName ||
                middleName.value != userProfile.middleName ||
                lastName.value != userProfile.lastName
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.paddingOf(context).bottom + 20,
                  left: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(localizations.appButtonsSaveChanges),
                )
                    .withLoadingState(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await updateProfile(
                            user: userProfile.copyWith(
                              email: email.value,
                              firstName: firstName.value,
                              middleName: middleName.value,
                              lastName: lastName.value,
                            ),
                            ref: ref,
                          );
                        }
                      },
                    )
                    .animate()
                    .fadeIn()
                    .slideY(begin: 0.1),
              )
            : null,
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
