import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:fur/shared/exceptions/error_codes.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/platform/network_info.dart';
import 'package:fur/src/authentication/data/databases/authentication_remote_database.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:logger/logger.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationRemoteDatabase remoteDatabase;

  AuthenticationRepositoryImpl(this.networkInfo, this.remoteDatabase);

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.signOut();
      return Right(response);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(e.code));
    } on Failure catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(e);
    } catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, User>> authenticateWithGoogle() async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.authenticateWithGoogle();

      return Right(response);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(e.code));
    } on Failure catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(e);
    } catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, User>> authenticateWithApple() async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.authenticateWithApple();

      return Right(response);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(e.code));
    } on Failure catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(e);
    } catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, User>> authenticateWithFacebook() async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.authenticateWithFacebook();

      return Right(response);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(e.code));
    } on Failure catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(e);
    } catch (e) {
      if (kDebugMode) Logger().e(e);
      return Left(Failure(ErrorCodes.unknownError));
    }
  }
}
