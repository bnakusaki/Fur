import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, void>> addProfilePicture(String path, String uid);
  Future<Either<Failure, bool>> hasProfile(String uid);
  Future<Either<Failure, User>> create(User user);
  Future<Either<Failure, User>> retrieve(String uid);
  Future<Either<Failure, User>> update(User user);
}
