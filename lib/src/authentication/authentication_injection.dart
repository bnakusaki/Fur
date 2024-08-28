import 'package:fur/src/authentication/data/authentication_repository_impl.dart';
import 'package:fur/src/authentication/data/databases/authentication_remote_database.dart';
import 'package:fur/src/authentication/domain/authentication_repository.dart';
import 'package:fur/src/authentication/domain/usecases/sign_in_with_email_otp.dart';
import 'package:fur/src/authentication/domain/usecases/verify_otp.dart';
import 'package:fur/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

void init() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => AuthenticationBloc(sl(), sl()))
    ..registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(sl()))
    ..registerLazySingleton<AuthenticationRemoteDatabase>(() => AuthenticationRemoteDatabaseImpl())
    ..registerLazySingleton(() => SignInWithEmailOtp(sl()))
    ..registerLazySingleton(() => VerifyOtp(sl()));
}
