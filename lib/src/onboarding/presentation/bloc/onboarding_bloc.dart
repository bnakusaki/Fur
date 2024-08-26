import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/domain/usecases/get_onboarding_status.dart';
import 'package:fur/src/onboarding/domain/usecases/set_onboarding_status.dart';

class OnboardingBloc {
  final GetOnboardingStatus _getOnboardingStatus;
  final SetOnboardingStatus _setOnboardingStatus;

  OnboardingBloc(
    this._getOnboardingStatus,
    this._setOnboardingStatus,
  );

  Future<Either<Failure, OnboardingStatus>> getOnboardingStatus() async {
    return await _getOnboardingStatus(NoParams());
  }

  Future<Either<Failure, void>> setOnboardingStatus(OnboardingStatus status) async {
    return await _setOnboardingStatus(ObjectParams(status));
  }
}
