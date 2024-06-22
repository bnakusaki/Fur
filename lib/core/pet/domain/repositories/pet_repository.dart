import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class PetsRepository {
  Future<Either<Failure, void>> savePetImage(String petId, String path);
  Future<Either<Failure, Pet>> create(Pet pet);
}
