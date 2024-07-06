import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class SavePetImage extends UseCase<void, ObjectParams<SavePetImageParams>> {
  final PetsRepository repository;
  SavePetImage(this.repository);

  @override
  Future<Either<Failure, String>> call(ObjectParams<SavePetImageParams> params) async {
    return await repository.savePetImage(params.value.petId, params.value.image);
  }
}

class SavePetImageParams {
  final String petId;
  final File image;

  SavePetImageParams({
    required this.petId,
    required this.image,
  });
}
