import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/core/pet/domain/usecases/create.dart';
import 'package:fur/core/pet/domain/usecases/list.dart';
import 'package:fur/core/pet/domain/usecases/list_pet_breeds.dart';
import 'package:fur/core/pet/domain/usecases/save_pet_image.dart';
import 'package:fur/core/pet/domain/usecases/update.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/usecase/usecase.dart';

class PetsBloc {
  final CreatePet _create;
  final ListPets _list;
  final UpdatePet _update;
  final ListPetBreeds _listPetBreeds;
  final SavePetImage _savePetImage;

  PetsBloc(
    this._list,
    this._create,
    this._update,
    this._listPetBreeds,
    this._savePetImage,
  );

  Future<Either<Failure, List<Pet>>> list(String uid) async {
    return await _list(ObjectParams(uid));
  }

  Future<Either<Failure, Pet>> create(Pet pet) async {
    return await _create(ObjectParams(pet));
  }

  Future<Either<Failure, Pet>> update(Pet pet) async {
    final params = ObjectParams(pet);
    return await _update(params);
  }

  Future<Either<Failure, List<PetBreed>>> listPetBreeds(String languageCode) async {
    return await _listPetBreeds(ObjectParams(languageCode));
  }

  Future<Either<Failure, String>> savePetImage(String petId, File image) async {
    final params = ObjectParams(SavePetImageParams(petId: petId, image: image));
    return await _savePetImage(params);
  }
}
