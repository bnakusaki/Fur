import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/domain/usecases/list_animals.dart';
import 'package:fur/core/animals/domain/usecases/list_breeds.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class AnimalsBloc {
  final ListAnimals _listAnimals;
  final ListBreeds _listBreeds;

  AnimalsBloc(this._listAnimals, this._listBreeds);

  Future<Either<Failure, List<Animal>>> listAnimals(String languageCode) async {
    return await _listAnimals(ObjectParams(languageCode));
  }

  Future<Either<Failure, List<Breed>>> listBreeds(String languageCode, String animalId) async {
    return await _listBreeds(
        ObjectParams(ListBreedsParams(languageCode: languageCode, animalId: animalId)));
  }
}
