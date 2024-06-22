import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/usecases/save_pet_image.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class PetsBloc {
  final SavePetImage _savePetImage;

  PetsBloc(this._savePetImage);

  Future<Either<Failure, void>> savePetImage(String petId, String path) async {
    final params = ObjectParams(SavePetImageParams(petId: petId, path: path));
    return await _savePetImage(params);
  }
}
