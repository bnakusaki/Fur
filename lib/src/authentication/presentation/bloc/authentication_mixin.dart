import 'package:flutter/material.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fur/src/home/presentation/interface/screens/home_screen.dart';

mixin AuthenticationMixin {
  final bloc = sl<AuthenticationBloc>();

  Future<User> authenticateWithGoogle(BuildContext context) async {
    final response = await bloc.authenticateWithGoogle();

    return response.fold(
      (failure) => throw failure,
      (user) {
        _onAuthSuccess(context);
        return user;
      },
    );
  }

  Future<User> authenticateWithApple(BuildContext context) async {
    final response = await bloc.authenticateWithApple();

    return response.fold(
      (failure) => throw failure,
      (user) {
        _onAuthSuccess(context);
        return user;
      },
    );
  }

  Future<User> authenticateWithFacebook(BuildContext context) async {
    final response = await bloc.authenticateWithFacebook();

    return response.fold(
      (failure) => throw failure,
      (user) {
        _onAuthSuccess(context);
        return user;
      },
    );
  }

  Future<User> createProfile({required User user}) async {
    final response = await bloc.createProfile(user);

    return response.fold(
      (failure) => throw failure,
      (user) {
        return user;
      },
    );
  }

  void _onAuthSuccess(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => true,
    );
  }
}
