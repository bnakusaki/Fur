import 'package:fur/injection_container.dart';
import 'package:fur/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'retrieve_has_profile.g.dart';

@riverpod
Future<bool> retrieveHasProfile(RetrieveHasProfileRef ref, String uid) async {
  final bloc = sl<ProfileBloc>();

  final result = await bloc.hasProfile(uid);

  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
