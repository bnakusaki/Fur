import 'package:fur/src/authentication/data/databases/authentication_remote_database.dart';
import 'package:fur/src/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:fur/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:fur/src/authentication/domain/usecases/authenticate_with_google.dart';
import 'package:fur/src/authentication/domain/usecases/sign_out.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

void initAuthentication() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => AuthenticationBloc(
          sl(),
          sl(),

          // sl(),
        ))
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl(), sl()),
    )
    ..registerLazySingleton<AuthenticationRemoteDatabase>(
      () => AuthenticationRemoteDatabaseImpl(),
    )
    ..registerLazySingleton(() => AuthenticateWithGoogle(sl()))
    ..registerLazySingleton(() => SignOut(sl()));
}
