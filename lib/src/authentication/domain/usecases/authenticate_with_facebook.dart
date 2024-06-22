import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticateWithFacebook extends UseCase<User, NoParams> {
  AuthenticateWithFacebook(this.repository);

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.authenticateWithFacebook();
  }
}
