import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/onboarding/domain/usecases/is_onboarding_completed.dart';
import 'package:fur/src/onboarding/domain/usecases/set_onboarding_completed.dart';

class OnboardingBloc {
  final SetOnboardingCompleted _setOnboardingCompleted;
  final IsOnboardingCompleted _isOnboardingCompleted;

  OnboardingBloc(
    this._setOnboardingCompleted,
    this._isOnboardingCompleted,
  );

  Future<Either<Failure, bool>> setOnboardingCompleted() async {
    return await _setOnboardingCompleted(NoParams());
  }

  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    return await _isOnboardingCompleted(NoParams());
  }
}
