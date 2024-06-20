import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/profile/domain/repositories/profile_repository.dart';

class CreateProfile extends UseCase<User, ObjectParams<User>> {
  final ProfileRepository repository;
  CreateProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(ObjectParams<User> params) async {
    return await repository.create(params.value);
  }
}
