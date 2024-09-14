import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';

class SignInWithGoogle extends UseCase<void, NoParams> {
  final AuthenticationRepository repository;
  SignInWithGoogle(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}
