import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';

class SignIn extends UseCase<User, ObjectParams<SignInParams>> {
  SignIn(this.repository);

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, User>> call(ObjectParams<SignInParams> params) async {
    return await repository.signIn(
      params.value.email,
      params.value.password,
    );
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}
