import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/repositories/animals_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class ListAnimals extends UseCase<List<Animal>, ObjectParams<String>> {
  final AnimalsRepository repository;

  ListAnimals(this.repository);

  @override
  Future<Either<Failure, List<Animal>>> call(ObjectParams<String> params) async {
    return await repository.listAnimals(params.value);
  }
}
