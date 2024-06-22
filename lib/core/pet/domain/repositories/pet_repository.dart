import 'package:dartz/dartz.dart';
import 'package:fur/shared/exceptions/failure.dart';

abstract class PetsRepository {
  Future<Either<Failure, void>> savePetImage(String petId, String path);
}
