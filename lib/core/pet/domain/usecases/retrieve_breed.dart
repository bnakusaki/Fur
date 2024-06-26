import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class RetrieveBreed extends UseCase<Breed, ObjectParams<RetrieveBreedParams>> {
  final PetsRepository repository;

  RetrieveBreed(this.repository);

  @override
  Future<Either<Failure, Breed>> call(ObjectParams<RetrieveBreedParams> params) async {
    return await repository.retrieveBreed(
      params.value.languageCode,
      params.value.breedId,
      params.value.speciesId,
    );
  }
}

class RetrieveBreedParams {
  final String languageCode;
  final String breedId;
  final String speciesId;

  RetrieveBreedParams({
    required this.languageCode,
    required this.breedId,
    required this.speciesId,
  });
}
