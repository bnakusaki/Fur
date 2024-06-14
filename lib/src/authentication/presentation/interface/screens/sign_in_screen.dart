// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_snack_bar.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_mixin.dart';
import 'package:fur/src/authentication/presentation/interface/screens/sign_up_screen.dart';
import 'package:fur/src/authentication/presentation/interface/widgets/app_text_form_field.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common_libs.dart';

class SignInScreen extends HookWidget with AuthenticationMixin {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final textStyles = Theme.of(context).extension<TextStyles>()!;

    final animationController = useAnimationController(duration: const Duration(milliseconds: 250));
    final obscurePassword = useState(true);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    localizations.appPageTitlesSignIn,
                    style: textStyles.h1,
                  ).animate().fadeIn(),
                  const SizedBox(height: 40),
                  ...[
                    AppTextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return localizations.appTextFieldErrorsEmptyEmail;
                        } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value)) {
                          return localizations.appTextFieldErrorsInvalidEmail;
                        }
                        return null;
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          AppIcons.envelope,
                          height: 20,
                        ),
                      ),
                      hintText: localizations.appTextFieldHintsEmail,
                    ),
                    const SizedBox(height: 20),
                    AppTextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return localizations.appTextFieldErrorsEmptyPassword;
                        }
                        if (value.length < 6) {
                          return localizations.appTextFieldErrorsPasswordTooShort;
                        }

                        return null;
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(
                          AppIcons.lock,
                          height: 20,
                        ),
                      ),
                      hintText: localizations.appTextFieldHintsPassword,
                      obscureText: obscurePassword.value,
                      suffixIcon: IconButton(
                        onPressed: () {
                          obscurePassword.value = !obscurePassword.value;
                          if (obscurePassword.value) {
                            animationController.reverse();
                          } else {
                            animationController.forward();
                          }
                        },
                        icon: LottieBuilder.asset(
                          frameRate: FrameRate.max,
                          controller: animationController,
                          AppAnimatedIcons.visibilityV2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(localizations.appButtonsSignIn),
                    ).withLoadingState(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          } on Failure catch (e) {
                            if (context.mounted) {
                              AppSnackBar.error(context, e.code);
                            }
                          }
                        }
                      },
                    ),
                  ].animate(interval: 50.milliseconds).fadeIn().slideY(begin: 0.1),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.paddingOf(context).bottom + 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(localizations.iDontHaveAnAccount),
              const SizedBox(width: 5),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    localizations.appButtonsSignUp,
                    style: textStyles.link,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
