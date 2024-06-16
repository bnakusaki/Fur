import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class AnimalsRepository {
  Future<Either<Failure, List<Animal>>> listAnimals(String languageCode);
}
