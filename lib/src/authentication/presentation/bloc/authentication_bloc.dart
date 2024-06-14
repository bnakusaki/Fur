import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/domain/usecases/sign_in.dart';
import 'package:fur/src/authentication/domain/usecases/sign_up.dart';

class AuthenticationBloc {
  final SignUp _signUp;
  final SignIn _signIn;

  AuthenticationBloc(this._signIn, this._signUp);

  Future<Either<Failure, User>> signUp(
    String firstName,
    String lastName,
    String middleName,
    String email,
    String password,
  ) async {
    final params = SignUpParams(
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      email: email,
      password: password,
    );

    return await _signUp(ObjectParams(params));
  }

  Future<Either<Failure, User>> signIn(
    String email,
    String password,
  ) async {
    final params = SignInParams(
      email: email,
      password: password,
    );

    return await _signIn(ObjectParams(params));
  }
}
