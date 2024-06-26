import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class PetsRepository {
  Future<Either<Failure, Pet>> create(Pet pet);
  Future<Either<Failure, List<Pet>>> list(String uid);
  Future<Either<Failure, Pet>> update(Pet pet);

  Future<Either<Failure, List<Species>>> listSpecies(String languageCode);
  Future<Either<Failure, Species>> retrieveSpecies(
    String languageCode,
    String speciesId,
  );

  Future<Either<Failure, List<Breed>>> listBreeds(String languageCode, String speciesId);
  Future<Either<Failure, Breed>> retrieveBreed(
    String languageCode,
    String breedId,
    String speciesId,
  );
}
