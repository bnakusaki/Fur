import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Verifies the OTP code sent to the user
class VerifyOtp extends UseCase<AuthResponse, ObjectParams<VerifyOtpParams>> {
  final AuthenticationRepository repository;
  VerifyOtp(this.repository);

  @override
  Future<Either<Failure, AuthResponse>> call(ObjectParams<VerifyOtpParams> params) async {
    return await repository.verifyOtp(params.value.email, params.value.token);
  }
}

class VerifyOtpParams {
  final String email;
  final String token;

  VerifyOtpParams({
    required this.email,
    required this.token,
  });
}
