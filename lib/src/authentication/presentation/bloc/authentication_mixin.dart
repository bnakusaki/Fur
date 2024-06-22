import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_bloc.dart';

mixin AuthenticationMixin {
  final bloc = sl<AuthenticationBloc>();

  Future<User> authenticateWithGoogle() async {
    final response = await bloc.authenticateWithGoogle();

    return response.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }

  Future<User> createProfile({required User user}) async {
    final response = await bloc.createProfile(user);

    return response.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }
}
