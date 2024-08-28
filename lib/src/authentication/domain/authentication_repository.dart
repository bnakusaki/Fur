import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationRepository {
  /// Sends an OTP code to the user
  Future<Either<Failure, void>> signInWithEmailOtp(String email);

  /// Verifies the OTP code sent to the user
  Future<Either<Failure, AuthResponse>> verifyOtp(String email, String token);
}
