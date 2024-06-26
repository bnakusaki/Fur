import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/usecases/authenticate_with_apple.dart';
import 'package:fur/src/authentication/domain/usecases/authenticate_with_facebook.dart';
import 'package:fur/src/authentication/domain/usecases/authenticate_with_google.dart';

class AuthenticationBloc {
  final AuthenticateWithGoogle _authenticateWithGoogle;
  final AuthenticateWithApple _authenticateWithApple;
  final AuthenticateWithFacebook _authenticateWithFacebook;

  AuthenticationBloc(
    this._authenticateWithGoogle,
    this._authenticateWithApple,
    this._authenticateWithFacebook,
  );

  Future<Either<Failure, User>> authenticateWithGoogle() async {
    return await _authenticateWithGoogle(NoParams());
  }

  Future<Either<Failure, User>> authenticateWithApple() async {
    return await _authenticateWithApple(NoParams());
  }

  Future<Either<Failure, User>> authenticateWithFacebook() async {
    return await _authenticateWithFacebook(NoParams());
  }
}
