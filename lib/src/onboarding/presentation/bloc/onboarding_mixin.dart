import 'package:fur/injection_container.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';

mixin OnboardingMixin {
  final bloc = sl<OnboardingBloc>();

  Future<bool> setOnboardingCompleted() async {
    final response = await bloc.setOnboardingCompleted();

    return response.fold(
      (failure) => throw failure,
      (success) => success,
    );
  }
}
