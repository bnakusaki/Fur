import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/profile/domain/repositories/profile_repository.dart';

class RetrieveProfile extends UseCase<User, ObjectParams<String>> {
  final ProfileRepository repository;
  RetrieveProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(ObjectParams<String> params) async {
    return await repository.retrieve(params.value);
  }
}
