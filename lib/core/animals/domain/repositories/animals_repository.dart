import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class AnimalsRepository {
  Future<Either<Failure, List<Animal>>> listAnimals(String languageCode);
  Future<Either<Failure, List<Breed>>> listBreeds(String languageCode, String animalId);
}
