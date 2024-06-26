import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/usecases/list_pets.dart';
import 'package:fur/core/pet/domain/usecases/save_pet_image.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class PetsBloc {
  final SavePetImage _savePetImage;
  final ListPets _listPets;

  PetsBloc(
    this._savePetImage,
    this._listPets,
  );

  Future<Either<Failure, void>> savePetImage(String petId, String path) async {
    final params = ObjectParams(SavePetImageParams(petId: petId, path: path));
    return await _savePetImage(params);
  }

  Future<Either<Failure, List<Pet>>> listPets(String uid) async {
    final params = ObjectParams(uid);
    return await _listPets(params);
  }
}
