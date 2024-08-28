import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/authentication/data/databases/authentication_remote_database.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';
import 'package:gotrue/src/types/auth_response.dart';
import 'package:logger/logger.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDatabase remoteDatabase;
  AuthenticationRepositoryImpl(this.remoteDatabase);

  @override
  Future<Either<Failure, void>> signInWithEmailOtp(String email) async {
    try {
      await remoteDatabase.signInWithEmailOtp(email);
      return const Right(null);
    } catch (e) {
      if (kDebugMode) Logger().e('Failed signInWithOtp: $e');
      return Left(Failure(''));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> verifyOtp(String email, String token) async {
    try {
      final response = await remoteDatabase.verifyOtp(email, token);
      return Right(response);
    } catch (e) {
      if (kDebugMode) Logger().e('Failed verifyOtp: $e');
      return Left(Failure(''));
    }
  }
}
