import 'package:fur/src/authentication/data/auth_repository_impl.dart';
import 'package:fur/src/authentication/data/databases/auth_remote_database.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';
import 'package:fur/src/authentication/domain/usecases/sign_in_with_google.dart';
import 'package:fur/src/authentication/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void init() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton<AuthenticationRepository>(() => AuthRepositoryImpl(sl()))
    ..registerLazySingleton<AuthRemoteDatabase>(() => AuthRemoteDatabaseImpl())
    ..registerLazySingleton(() => SignInWithGoogle(sl()));
}
