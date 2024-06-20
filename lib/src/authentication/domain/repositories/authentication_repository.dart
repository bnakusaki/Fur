import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> signUp(
    String firstName,
    String lastName,
    String middleName,
    String email,
    String password,
  );

  Future<Either<Failure, User>> signIn(String email, String password);

  Future<Either<Failure, void>> signOut();
}
