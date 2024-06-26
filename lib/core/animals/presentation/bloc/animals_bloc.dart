import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/domain/usecases/list_animals.dart';
import 'package:fur/core/animals/domain/usecases/list_breeds.dart';
import 'package:fur/core/animals/domain/usecases/retrieve_breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/usecases/create_pet.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class AnimalsBloc {
  final ListAnimals _listAnimals;
  final ListBreeds _listBreeds;
  final CreatePet _createPet;
  final RetrieveBreed _retrieveBreed;

  AnimalsBloc(
    this._listAnimals,
    this._listBreeds,
    this._createPet,
    this._retrieveBreed,
  );

  Future<Either<Failure, List<Animal>>> listAnimals(String languageCode) async {
    return await _listAnimals(ObjectParams(languageCode));
  }

  Future<Either<Failure, List<Breed>>> listBreeds(String languageCode, String animalId) async {
    return await _listBreeds(
        ObjectParams(ListBreedsParams(languageCode: languageCode, animalId: animalId)));
  }

  Future<Either<Failure, Pet>> createPet(Pet pet) async {
    final params = ObjectParams(pet);
    return await _createPet(params);
  }

  Future<Either<Failure, Breed>> retrieveBreed(
    String languageCode,
    String breedId,
    String animalId,
  ) async {
    final params = ObjectParams(RetrieveBreedParams(
      languageCode: languageCode,
      breedId: breedId,
      animalId: animalId,
    ));
    return await _retrieveBreed(params);
  }
}
