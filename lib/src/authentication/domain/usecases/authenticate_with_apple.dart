import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticateWithApple extends UseCase<User, NoParams> {
  AuthenticateWithApple(this.repository);

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.authenticateWithApple();
  }
}
