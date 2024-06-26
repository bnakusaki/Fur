import 'package:fur/core/animals/data/databases/animals_remote_database.dart';
import 'package:fur/core/animals/data/repositories/animals_repository_impl.dart';
import 'package:fur/core/animals/domain/repositories/animals_repository.dart';
import 'package:fur/core/animals/domain/usecases/list_animals.dart';
import 'package:fur/core/animals/domain/usecases/list_breeds.dart';
import 'package:fur/core/animals/domain/usecases/retrieve_breed.dart';
import 'package:fur/core/animals/presentation/bloc/animals_bloc.dart';
import 'package:get_it/get_it.dart';

void initAnimals() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => AnimalsBloc(sl(), sl(), sl(), sl()))
    ..registerLazySingleton<AnimalsRepository>(() => AnimalsRepositoryImpl(sl(), sl()))
    ..registerLazySingleton<AnimalsRemoteDatabase>(() => AnimalsRemoteDatabaseImpl())
    ..registerLazySingleton(() => ListAnimals(sl()))
    ..registerLazySingleton(() => ListBreeds(sl()))
    ..registerLazySingleton(() => RetrieveBreed(sl()));
}
