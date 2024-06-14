import 'package:fur/src/onboarding/data/databases/onboarding_local_database.dart';
import 'package:fur/src/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:fur/src/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:fur/src/onboarding/domain/usecases/is_onboarding_completed.dart';
import 'package:fur/src/onboarding/domain/usecases/set_onboarding_completed.dart';
import 'package:fur/src/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

void initOnboarding() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => OnboardingBloc(sl(), sl()))
    ..registerLazySingleton<OnboardingRepository>(() => OnboardingRepositoryImpl(sl()))
    ..registerLazySingleton<OnboardingLocalDatabase>(() => OnboardingLocalDatabaseImpl())
    ..registerLazySingleton(() => SetOnboardingCompleted(sl()))
    ..registerLazySingleton(() => IsOnboardingCompleted(sl()));
}
