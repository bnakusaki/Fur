import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/profile/domain/usecases/add_profile_picture.dart';
import 'package:fur/src/profile/domain/usecases/has_profile.dart';

class ProfileBloc {
  final AddProfilePicture _addProfilePicture;
  final HasProfile _hasProfile;

  ProfileBloc(
    this._addProfilePicture,
    this._hasProfile,
  );

  Future<Either<Failure, void>> addProfilePicture(String path, String uid) async {
    final params = AddProfilePictureParams(uid: uid, path: path);
    return await _addProfilePicture(ObjectParams(params));
  }

  Future<Either<Failure, bool>> hasProfile(String uid) async {
    return await _hasProfile(ObjectParams(uid));
  }
}
