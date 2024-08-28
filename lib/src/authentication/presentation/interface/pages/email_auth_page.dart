import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fur/shared/extensions/elevated_button.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_mixin.dart';
import 'package:fur/src/authentication/presentation/interface/pages/otp_page.dart';
import 'package:gap/gap.dart';

class EmailAuthPage extends HookWidget with AuthenticationMixin {
  EmailAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final controller = useTextEditingController();
    final loading = useState(false);

    Future<void> handleContinue() async {
      if (formKey.currentState!.validate()) {
        try {
          loading.value = true;
          await signInWithEmailOtp(controller.text);
          if (context.mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpPage(email: controller.text),
              ),
            );
          }
        } catch (e) {
          // Logger().e(e);
        } finally {
          loading.value = false;
        }
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              const _AppBar(),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.emailAddress,
                    keyboardAppearance: Brightness.dark,
                    enabled: !loading.value,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onFieldSubmitted: (_) async => await handleContinue(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      /// Match value to email regex
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: handleContinue,
                  child: const Text('Continue'),
                ).withLoadingState(explicitLoading: loading.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 160 + MediaQuery.paddingOf(context).top,
      width: double.maxFinite,
      decoration: BoxDecoration(color: theme.primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email',
              style: theme.textTheme.displayMedium!.copyWith(color: Colors.white),
            ),
            const Gap(10),
            Text(
              'Enter your email address to continue.',
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
