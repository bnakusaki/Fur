import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, void>> signInWithGoogle();
}
