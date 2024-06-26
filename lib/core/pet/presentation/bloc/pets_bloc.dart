import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/domain/usecases/create.dart';
import 'package:fur/core/pet/domain/usecases/list.dart';
import 'package:fur/core/pet/domain/usecases/list_breeds.dart';
import 'package:fur/core/pet/domain/usecases/list_species.dart';
import 'package:fur/core/pet/domain/usecases/retrieve_breed.dart';
import 'package:fur/core/pet/domain/usecases/retrieve_species.dart';
import 'package:fur/core/pet/domain/usecases/update.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class PetsBloc {
  final CreatePet _createPet;
  final ListPets _listPets;
  final RetrieveSpecies _retrieveSpecies;
  final ListSpecies _listSpecies;
  final ListBreeds _listBreeds;
  final RetrieveBreed _retrieveBreed;
  final UpdatePet _updatePet;

  PetsBloc(
    this._retrieveSpecies,
    this._listPets,
    this._createPet,
    this._listBreeds,
    this._listSpecies,
    this._retrieveBreed,
    this._updatePet,
  );

  Future<Either<Failure, Species>> retrieveSpecies(String languageCode, String speciesId) async {
    final params =
        ObjectParams(RetrieveSpeciesParams(languageCode: languageCode, speciesId: speciesId));
    return await _retrieveSpecies(params);
  }

  Future<Either<Failure, List<Pet>>> listPets(String uid) async {
    final params = ObjectParams(uid);
    return await _listPets(params);
  }

  Future<Either<Failure, List<Species>>> listspecies(String languageCode) async {
    return await _listSpecies(ObjectParams(languageCode));
  }

  Future<Either<Failure, List<Breed>>> listBreeds(String languageCode, String speciesId) async {
    return await _listBreeds(
        ObjectParams(ListBreedsParams(languageCode: languageCode, speciesId: speciesId)));
  }

  Future<Either<Failure, Pet>> createPet(Pet pet) async {
    final params = ObjectParams(pet);
    return await _createPet(params);
  }

  Future<Either<Failure, Breed>> retrieveBreed(
    String languageCode,
    String breedId,
    String speciesId,
  ) async {
    final params = ObjectParams(RetrieveBreedParams(
      languageCode: languageCode,
      breedId: breedId,
      speciesId: speciesId,
    ));
    return await _retrieveBreed(params);
  }

  Future<Either<Failure, Pet>> updatePet(Pet pet) async {
    final params = ObjectParams(pet);
    return await _updatePet(params);
  }
}
