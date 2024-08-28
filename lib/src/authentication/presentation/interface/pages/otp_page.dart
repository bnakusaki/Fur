import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/widgets/app_loading_indicator.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_mixin.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends HookWidget with AuthenticationMixin {
  OtpPage({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loading = useState(false);
    final otp = ValueNotifier<String>('');
    final errorAnimationController = useStreamController<ErrorAnimationType>();

    Future<void> handleSignIn(String email, String otp) async {
      try {
        loading.value = true;
        final response = await verifyOtp(email, otp);

        /// if there is a user related to this account navigate to the [HomeScreen].
        if (response.user != null && context.mounted) context.replace('/');
      } catch (e) {
        errorAnimationController.add(ErrorAnimationType.shake);
      } finally {
        loading.value = false;
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              _AppBar(email: email),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: LayoutBuilder(builder: (context, constraints) {
                  final boxWidth = (constraints.maxWidth - 50) / 6;
                  return ListenableBuilder(
                      listenable: otp,
                      builder: (context, child) {
                        return PinCodeTextField(
                          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                          appContext: context,
                          length: 6,
                          animationType: AnimationType.fade,
                          autoFocus: true,
                          errorAnimationController: errorAnimationController,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(20),
                            fieldHeight: boxWidth,
                            fieldWidth: boxWidth,
                            selectedColor: theme.primaryColor,
                            inactiveColor: Colors.grey,
                          ),

                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          keyboardType: TextInputType.number,
                          enabled: !loading.value,
                          onCompleted: (value) async {
                            await handleSignIn(email, value);
                          },
                          onChanged: (value) {
                            // otp.value = value;
                          },
                          // controller: otpFieldController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        );
                      });
                }),
              ),
              const Gap(10),
              if (loading.value) const AppLoadingIndicator().animate().fadeIn(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 160 + MediaQuery.paddingOf(context).top,
      width: double.maxFinite,
      decoration: BoxDecoration(color: theme.primaryColor),
      child: Padding(
        padding: const EdgeInsets.only(
          // left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(MediaQuery.paddingOf(context).top),
            Transform.translate(
              offset: const Offset(5, 0),
              child: const BackButton(color: Colors.white),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'OTP Verification',
                style: theme.textTheme.displayMedium!.copyWith(color: Colors.white),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'OTP sent to: $email',
                style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
