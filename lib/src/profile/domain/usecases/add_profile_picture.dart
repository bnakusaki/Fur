import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/profile/domain/repositories/profile_repository.dart';

class AddProfilePicture extends UseCase<void, ObjectParams<AddProfilePictureParams>> {
  final ProfileRepository repository;
  AddProfilePicture(this.repository);

  @override
  Future<Either<Failure, void>> call(ObjectParams<AddProfilePictureParams> params) async {
    return await repository.addProfilePicture(params.value.path, params.value.uid);
  }
}

class AddProfilePictureParams {
  final String uid;
  final String path;

  AddProfilePictureParams({
    required this.uid,
    required this.path,
  });
}
