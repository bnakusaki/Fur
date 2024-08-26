import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';

abstract class OnboardingRepository {
  /// Retrieves the user's onboarding status.
  Future<Either<Failure, OnboardingStatus>> getOnboardingStatus();

  /// Sets the user's onboarding status.
  Future<Either<Failure, void>> setOnboardingStatus(OnboardingStatus status);
}
