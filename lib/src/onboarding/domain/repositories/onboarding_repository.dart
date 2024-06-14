import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class OnboardingRepository {
  Future<Either<Failure, bool>> setOnboardingCompleted();
  Future<Either<Failure, bool>> isOnboardingCompleted();
}
