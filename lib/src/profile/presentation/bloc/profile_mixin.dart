import 'package:fur/injection_container.dart';
import 'package:fur/src/profile/presentation/bloc/profile_bloc.dart';

mixin ProfileMixin {
  final bloc = sl<ProfileBloc>();

  Future<void> addProfilePicture(String path, String uid) async {
    final response = await bloc.addProfilePicture(path, uid);

    return response.fold(
      (failure) => throw failure,
      (success) => success,
    );
  }
}
