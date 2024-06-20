import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_bloc.dart';

mixin AuthenticationMixin {
  final bloc = sl<AuthenticationBloc>();

  Future<User> signUp({
    required String firstName,
    required String middleName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await bloc.signUp(firstName, lastName, middleName, email, password);

    return response.fold(
      (failure) => throw failure,
      (user) => user,
    );
  }

  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final response = await bloc.signIn(email, password);

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
