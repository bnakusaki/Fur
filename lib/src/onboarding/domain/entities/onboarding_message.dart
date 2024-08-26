import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_message.freezed.dart';

@freezed
class OnboardingMessage with _$OnboardingMessage {
  factory OnboardingMessage({
    required String title,
    required String description,
    required String image,
  }) = _OnboardingMessage;
}
