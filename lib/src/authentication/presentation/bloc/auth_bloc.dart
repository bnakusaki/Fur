import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/usecases/sign_in_with_google.dart';

class AuthBloc {
  final SignInWithGoogle _signInWithGoogle;
  AuthBloc(this._signInWithGoogle);

  Future<Either<Failure, void>> signInWithEmailOtp() async {
    return await _signInWithGoogle(NoParams());
  }
}
