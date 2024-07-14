import 'dart:io';

import 'package:fur/common_libs.dart';
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
    final reponse = await bloc.create(pet);

    return reponse.fold(
      (failure) => throw failure,
      (pet) => pet,
    );
  }

  Future<Pet> updatePet(Pet pet) async {
    final reponse = await bloc.update(pet);

    return reponse.fold(
      (failure) => throw failure,
      (pet) => pet,
    );
  }

  String parseAge(DateTime dob, AppLocalizations localizations) {
    final now = DateTime.now();
    final years = now.difference(dob).inDays ~/ 365;
    final months = (now.difference(dob).inDays % 365) ~/ 30;
    final weeks = ((now.difference(dob).inDays % 365) % 30) ~/ 7;
    final days = ((now.difference(dob).inDays % 365) % 30) % 7;

    if (years > 0) {
      return localizations.years(years);
    } else if (months > 0) {
      return localizations.months(months);
    } else if (weeks > 0) {
      return localizations.weeks(weeks);
    } else {
      return localizations.days(days);
    }
  }

  Future<String> savePetImage(String petId, File image) async {
    final response = await bloc.savePetImage(petId, image);

    return response.fold(
      (failure) => throw failure,
      (url) => url,
    );
  }

  Map<DateTime, double> sortWeightHistory(Map<DateTime, double> history) {
    final sortedKeys = history.keys.toList()..sort();
    return {for (var k in sortedKeys) k: history[k]!};
  }
}
