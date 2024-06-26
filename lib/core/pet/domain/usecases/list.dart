import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class ListPets extends UseCase<void, ObjectParams<String>> {
  final PetsRepository repository;
  ListPets(this.repository);

  @override
  Future<Either<Failure, List<Pet>>> call(ObjectParams<String> params) async {
    return await repository.list(params.value);
  }
}
