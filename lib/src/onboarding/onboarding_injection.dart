import 'package:fur/src/onboarding/data/databases/onboarding_local_database.dart';
import 'package:fur/src/onboarding/data/onboarding_repository_impl.dart';
import 'package:fur/src/onboarding/domain/onboarding_repository.dart';
import 'package:fur/src/onboarding/domain/usecases/get_onboarding_status.dart';
import 'package:fur/src/onboarding/domain/usecases/set_onboarding_status.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

void init() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => OnboardingBloc(sl(), sl()))
    ..registerLazySingleton<OnboardingRepository>(() => OnboardingRepositoryImpl(sl()))
    ..registerLazySingleton<OnboardingLocalDatabase>(() => OnboardingLocalDatabaseImpl())
    ..registerLazySingleton(() => GetOnboardingStatus(sl()))
    ..registerLazySingleton(() => SetOnboardingStatus(sl()));
}
