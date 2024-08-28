import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin AuthenticationMixin {
  final bloc = sl<AuthenticationBloc>();

  Future<void> signInWithEmailOtp(String email) async {
    final response = await bloc.signInWithEmailOtp(email);

    return response.fold(
      (failure) => throw failure,
      (success) => null,
    );
  }

  Future<AuthResponse> verifyOtp(String email, String token) async {
    final response = await bloc.verifyOtp(email, token);

    return response.fold(
      (failure) => throw failure,
      (success) => success,
    );
  }
}
