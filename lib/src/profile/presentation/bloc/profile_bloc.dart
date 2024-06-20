import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/profile/domain/usecases/add_profile_picture.dart';
import 'package:fur/src/profile/domain/usecases/has_profile.dart';
import 'package:fur/src/profile/domain/usecases/retrieve_profile.dart';
import 'package:fur/src/profile/domain/usecases/update_profile.dart';

class ProfileBloc {
  final AddProfilePicture _addProfilePicture;
  final HasProfile _hasProfile;
  final RetrieveProfile _retrieve;
  final UpdateProfile _update;

  ProfileBloc(
    this._addProfilePicture,
    this._hasProfile,
    this._retrieve,
    this._update,
  );

  Future<Either<Failure, void>> addProfilePicture(String path, String uid) async {
    final params = AddProfilePictureParams(uid: uid, path: path);
    return await _addProfilePicture(ObjectParams(params));
  }

  Future<Either<Failure, bool>> hasProfile(String uid) async {
    return await _hasProfile(ObjectParams(uid));
  }

  Future<Either<Failure, User>> retrieve(String uid) async {
    return await _retrieve(ObjectParams(uid));
  }

  Future<Either<Failure, User>> update(User user) async {
    return await _update(ObjectParams(user));
  }
}
