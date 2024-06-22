import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class SavePetImage extends UseCase<void, ObjectParams<SavePetImageParams>> {
  final PetsRepository repository;
  SavePetImage(this.repository);

  @override
  Future<Either<Failure, void>> call(ObjectParams<SavePetImageParams> params) async {
    return await repository.savePetImage(params.value.petId, params.value.path);
  }
}

class SavePetImageParams {
  final String petId;
  final String path;

  SavePetImageParams({
    required this.petId,
    required this.path,
  });
}
