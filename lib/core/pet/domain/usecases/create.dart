import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class CreatePet extends UseCase<void, ObjectParams<Pet>> {
  final PetsRepository repository;
  CreatePet(this.repository);

  @override
  Future<Either<Failure, Pet>> call(ObjectParams<Pet> params) async {
    return await repository.create(params.value);
  }
}
