import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/assets/app_images.dart';

mixin PetsMixin {
  final sadPets = [
    AppImages.sadCat,
    AppImages.sadDog,
    AppImages.sadHamster,
    AppImages.sadHorse,
    AppImages.sadRabbit,
  ];

  final bloc = sl<PetsBloc>();

  Future<Pet> createPet(Pet pet) async {
    final reponse = await bloc.createPet(pet);

    return reponse.fold(
      (failure) => throw failure,
      (pet) => pet,
    );
  }
}
