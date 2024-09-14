import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/presentation/bloc/auth_bloc.dart';

mixin AuthMixin {
  final bloc = sl<AuthBloc>();

  Future<void> signInWithGoogle() async {
    final response = await bloc.signInWithEmailOtp();

    return response.fold(
      (failure) => throw failure,
      (success) => null,
    );
  }
}
