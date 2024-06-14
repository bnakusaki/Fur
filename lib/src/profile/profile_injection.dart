import 'package:fur/src/profile/data/databases/profile_remote_database.dart';
import 'package:fur/src/profile/data/repositories/profile_repository_impl.dart';
import 'package:fur/src/profile/domain/repositories/profile_repository.dart';
import 'package:fur/src/profile/domain/usecases/add_profile_picture.dart';
import 'package:fur/src/profile/domain/usecases/has_profile.dart';
import 'package:fur/src/profile/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';

void initProfile() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => ProfileBloc(sl(), sl()))
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<ProfileRemoteDatabase>(() => ProfileRemoteDatabaseImpl())
    ..registerLazySingleton(() => AddProfilePicture(sl()))
    ..registerLazySingleton(() => HasProfile(sl()));
}
