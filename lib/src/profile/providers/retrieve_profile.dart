import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'retrieve_profile.g.dart';

@riverpod
Future<User> retrieveProfile(RetrieveProfileRef ref, String uid) async {
  final bloc = sl<ProfileBloc>();

  final response = await bloc.retrieve(uid);

  return response.fold(
    (failure) => throw failure,
    (success) => success,
  );
}
