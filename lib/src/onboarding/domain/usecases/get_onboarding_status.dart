import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/domain/onboarding_repository.dart';

class GetOnboardingStatus extends UseCase<OnboardingStatus, NoParams> {
  final OnboardingRepository repository;
  GetOnboardingStatus(this.repository);

  @override
  Future<Either<Failure, OnboardingStatus>> call(NoParams params) async {
    return await repository.getOnboardingStatus();
  }
}
