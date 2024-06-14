import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/error_codes.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/onboarding/data/databases/onboarding_local_database.dart';
import 'package:fur/src/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatabase localDatabase;

  OnboardingRepositoryImpl(this.localDatabase);

  @override
  Future<Either<Failure, bool>> setOnboardingCompleted() async {
    try {
      final response = await localDatabase.setOnboardingCompleted();
      return Right(response);
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, bool>> isOnboardingCompleted() async {
    try {
      final response = await localDatabase.isOnboardingCompleted();
      return Right(response);
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }
}
