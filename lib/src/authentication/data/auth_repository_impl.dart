import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/authentication/data/databases/auth_remote_database.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';
import 'package:logger/logger.dart';

class AuthRepositoryImpl implements AuthenticationRepository {
  final AuthRemoteDatabase remoteDatabase;
  AuthRepositoryImpl(this.remoteDatabase);

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await remoteDatabase.signInWithGoogle();
      return const Right(null);
    } catch (e) {
      if (kDebugMode) Logger().e('Failed: $e');
      return Left(Failure(''));
    }
  }
}
