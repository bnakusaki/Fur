import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/onboarding/domain/repositories/onboarding_repository.dart';

class SetOnboardingCompleted extends UseCase<bool, NoParams> {
  late final OnboardingRepository repository;
  SetOnboardingCompleted(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.setOnboardingCompleted();
  }
}
