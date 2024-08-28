import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';

/// Sends an OTP code to the user
class SignInWithEmailOtp extends UseCase<void, ObjectParams<String>> {
  final AuthenticationRepository repository;
  SignInWithEmailOtp(this.repository);

  @override
  Future<Either<Failure, void>> call(ObjectParams<String> params) async {
    return await repository.signInWithEmailOtp(params.value);
  }
}
