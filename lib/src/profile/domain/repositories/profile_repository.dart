import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> addProfilePicture(String path, String uid);
  Future<Either<Failure, bool>> hasProfile(String uid);
}
