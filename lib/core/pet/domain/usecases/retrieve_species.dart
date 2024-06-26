import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class RetrieveSpecies extends UseCase<Species, ObjectParams<RetrieveSpeciesParams>> {
  final PetsRepository repository;
  RetrieveSpecies(this.repository);

  @override
  Future<Either<Failure, Species>> call(ObjectParams<RetrieveSpeciesParams> params) async {
    return await repository.retrieveSpecies(params.value.languageCode, params.value.speciesId);
  }
}

class RetrieveSpeciesParams {
  final String languageCode;
  final String speciesId;

  RetrieveSpeciesParams({
    required this.languageCode,
    required this.speciesId,
  });
}
