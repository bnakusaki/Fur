import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/domain/onboarding_repository.dart';

class SetOnboardingStatus extends UseCase<void, ObjectParams<OnboardingStatus>> {
  final OnboardingRepository repository;
  SetOnboardingStatus(this.repository);

  @override
  Future<Either<Failure, void>> call(ObjectParams<OnboardingStatus> params) async {
    return await repository.setOnboardingStatus(params.value);
  }
}
