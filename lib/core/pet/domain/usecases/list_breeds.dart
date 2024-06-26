import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class ListBreeds extends UseCase<List<Breed>, ObjectParams<ListBreedsParams>> {
  final PetsRepository repository;

  ListBreeds(this.repository);

  @override
  Future<Either<Failure, List<Breed>>> call(ObjectParams<ListBreedsParams> params) async {
    return await repository.listBreeds(params.value.languageCode, params.value.speciesId);
  }
}

class ListBreedsParams {
  final String languageCode;
  final String speciesId;

  ListBreedsParams({
    required this.languageCode,
    required this.speciesId,
  });
}
