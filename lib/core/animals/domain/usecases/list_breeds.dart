import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/domain/repositories/animals_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class ListBreeds extends UseCase<List<Breed>, ObjectParams<ListBreedsParams>> {
  final AnimalsRepository repository;

  ListBreeds(this.repository);

  @override
  Future<Either<Failure, List<Breed>>> call(ObjectParams<ListBreedsParams> params) async {
    return await repository.listBreeds(
        params.value.languageCode, params.value.animalId, params.value.last);
  }
}

class ListBreedsParams {
  final String languageCode;
  final String animalId;
  final Breed? last;

  ListBreedsParams({
    required this.languageCode,
    required this.animalId,
    this.last,
  });
}
