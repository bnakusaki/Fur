import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> authenticateWithGoogle();
  Future<Either<Failure, User>> authenticateWithApple();
  Future<Either<Failure, User>> authenticateWithFacebook();
  Future<Either<Failure, void>> signOut();
}
