import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/profile/domain/repositories/profile_repository.dart';

class HasProfile extends UseCase<bool, ObjectParams<String>> {
  final ProfileRepository repository;
  HasProfile(this.repository);

  @override
  Future<Either<Failure, bool>> call(ObjectParams<String> params) async {
    return await repository.hasProfile(params.value);
  }
}
