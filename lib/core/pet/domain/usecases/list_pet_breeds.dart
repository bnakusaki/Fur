import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class ListPetBreeds extends UseCase<List<PetBreed>, ObjectParams<String>> {
  final PetsRepository repository;

  ListPetBreeds(this.repository);

  @override
  Future<Either<Failure, List<PetBreed>>> call(ObjectParams<String> params) async {
    return await repository.listPetBreeds(params.value);
  }
}
