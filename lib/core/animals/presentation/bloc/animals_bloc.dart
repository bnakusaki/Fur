import 'package:dartz/dartz.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/usecases/list_animals.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class AnimalsBloc {
  final ListAnimals _listAnimals;

  AnimalsBloc(this._listAnimals);

  Future<Either<Failure, List<Animal>>> listAnimals(String languageCode) async {
    return await _listAnimals(ObjectParams(languageCode));
  }
}
