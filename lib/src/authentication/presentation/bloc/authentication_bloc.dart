import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/domain/usecases/authenticate_with_google.dart';
import 'package:fur/src/profile/domain/usecases/create_profile.dart';

class AuthenticationBloc {
  final AuthenticateWithGoogle _authenticateWithGoogle;
  final CreateProfile _createProfile;
  // final SignOut _signOut;

  AuthenticationBloc(
    this._authenticateWithGoogle,
    this._createProfile,
    // this._signOut,
  );

  Future<Either<Failure, User>> authenticateWithGoogle() async {
    return await _authenticateWithGoogle(NoParams());
  }

  // Future<Either<Failure, void>> signOut() async {
  //   return await _signOut(NoParams());
  // }

  Future<Either<Failure, User>> createProfile(User user) async {
    return await _createProfile(ObjectParams(user));
  }
}
