import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  SignOut(this.repository);

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
