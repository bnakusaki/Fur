import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/onboarding/domain/repositories/onboarding_repository.dart';

class IsOnboardingCompleted extends UseCase<bool, NoParams> {
  late final OnboardingRepository repository;
  IsOnboardingCompleted(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.isOnboardingCompleted();
  }
}
