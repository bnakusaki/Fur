import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';

class SignUp extends UseCase<User, ObjectParams<SignUpParams>> {
  SignUp(this.repository);

  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, User>> call(ObjectParams<SignUpParams> params) async {
    return await repository.signUp(
      params.value.firstName,
      params.value.lastName,
      params.value.middleName,
      params.value.email,
      params.value.password,
    );
  }
}

class SignUpParams {
  final String firstName;
  final String lastName;
  final String middleName;
  final String email;
  final String password;

  SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.email,
    required this.password,
  });
}
