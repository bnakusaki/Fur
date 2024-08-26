import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/onboarding/data/databases/onboarding_local_database.dart';
import 'package:fur/src/onboarding/domain/entities/onboarding_status.dart';
import 'package:fur/src/onboarding/domain/onboarding_repository.dart';
import 'package:logger/logger.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDatabase localDatabase;
  OnboardingRepositoryImpl(this.localDatabase);

  /// Retrieves the user's onboarding status.
  @override
  Future<Either<Failure, OnboardingStatus>> getOnboardingStatus() async {
    try {
      final status = await localDatabase.getOnboardingStatus();
      return Right(status);
    } on Exception catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(''));
    }
  }

  /// Sets the user's onboarding status.
  @override
  Future<Either<Failure, void>> setOnboardingStatus(OnboardingStatus status) async {
    try {
      await localDatabase.setOnboardingStatus(status);
      return const Right(null);
    } on Exception catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(''));
    }
  }
}
