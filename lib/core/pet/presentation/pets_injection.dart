import 'package:fur/core/pet/data/databases/pets_remote_database.dart';
import 'package:fur/core/pet/data/repositories/pet_repository_impl.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/core/pet/domain/usecases/create_pet.dart';
import 'package:fur/core/pet/domain/usecases/save_pet_image.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:get_it/get_it.dart';

void initPets() {
  final sl = GetIt.instance;

  sl
    ..registerFactory(() => PetsBloc(sl()))
    ..registerLazySingleton<PetsRemoteDatabase>(() => PetsRemoteDatabaseImpl())
    ..registerLazySingleton<PetsRepository>(() => PetsRepositoryImpl(sl(), sl()))
    ..registerLazySingleton(() => SavePetImage(sl()))
    ..registerLazySingleton(() => CreatePet(sl()));
}
