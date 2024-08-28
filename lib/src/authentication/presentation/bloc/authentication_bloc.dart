import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';
import 'package:fur/src/authentication/domain/usecases/sign_in_with_email_otp.dart';
import 'package:fur/src/authentication/domain/usecases/verify_otp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationBloc {
  final SignInWithEmailOtp _signInWithEmailOtp;
  final VerifyOtp _verifyOtp;
  AuthenticationBloc(
    this._signInWithEmailOtp,
    this._verifyOtp,
  );

  /// Sends an OTP code to the user
  Future<Either<Failure, void>> signInWithEmailOtp(String email) async {
    return await _signInWithEmailOtp(ObjectParams(email));
  }

  /// Verifies the OTP code sent to the user
  Future<Either<Failure, AuthResponse>> verifyOtp(String email, String token) async {
    return await _verifyOtp(ObjectParams(VerifyOtpParams(email: email, token: token)));
  }
}
