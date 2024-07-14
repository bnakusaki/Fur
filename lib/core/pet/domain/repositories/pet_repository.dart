import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class PetsRepository {
  Future<Either<Failure, Pet>> create(Pet pet);
  Future<Either<Failure, List<Pet>>> list(String uid);
  Future<Either<Failure, Pet>> update(Pet pet);

  Future<Either<Failure, String>> savePetImage(String petId, File image);
  Future<Either<Failure, List<PetBreed>>> listPetBreeds(String languageCode);
}
