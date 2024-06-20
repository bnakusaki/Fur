import 'package:fur/injection_container.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:fur/src/authentication/presentation/providers/user_notifier.dart';
import 'package:fur/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin ProfileMixin {
  final bloc = sl<ProfileBloc>();

  Future<void> addProfilePicture({required String path, required String uid}) async {
    final response = await bloc.addProfilePicture(path, uid);

    return response.fold(
      (failure) => throw failure,
      (success) => success,
    );
  }

  Future<User> updateProfile({required User user, required WidgetRef ref}) async {
    final response = await bloc.update(user);

    return response.fold(
      (failure) => throw failure,
      (profile) {
        ref.watch(userNotifierProvider.notifier).set(profile);
        return profile;
      },
    );
  }
}
