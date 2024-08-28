import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthenticationRemoteDatabase {
  /// Sends an OTP code to the user
  Future<void> signInWithEmailOtp(String email);

  /// Verifies the OTP code sent to the user
  Future<AuthResponse> verifyOtp(String email, String otp);
}

class AuthenticationRemoteDatabaseImpl implements AuthenticationRemoteDatabase {
  final _supabase = Supabase.instance.client;

  /// Sends an OTP code to the user
  @override
  Future<void> signInWithEmailOtp(String email) async {
    if (kDebugMode) Logger().d('Sending email OTP to: $email');
    await _supabase.auth.signInWithOtp(email: email);
    if (kDebugMode) Logger().d('Email OTP sent to: $email');
  }

  /// Verifies the OTP code sent to the user
  @override
  Future<AuthResponse> verifyOtp(String email, String token) async {
    if (kDebugMode) Logger().d('Verifying OTP for: $email with OTP: $token');
    final response = await _supabase.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.email,
    );
    return response;
  }
}
