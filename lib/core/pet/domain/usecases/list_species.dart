import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class ListSpecies extends UseCase<List<Species>, ObjectParams<String>> {
  final PetsRepository repository;

  ListSpecies(this.repository);

  @override
  Future<Either<Failure, List<Species>>> call(ObjectParams<String> params) async {
    return await repository.listSpecies(params.value);
  }
}
