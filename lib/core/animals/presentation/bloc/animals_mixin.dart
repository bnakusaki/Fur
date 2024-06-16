import 'package:flutter/material.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/core/animals/domain/entities/pet.dart';
import 'package:fur/shared/assets/app_images.dart';

mixin AnimalMixin {
  final sadPets = [
    AppImages.sadCat,
    AppImages.sadDog,
    AppImages.sadHamster,
    AppImages.sadHorse,
    AppImages.sadRabbit,
  ];
  String getPetName(BuildContext context, Pets pet) {
    final localizations = AppLocalizations.of(context)!;

    return switch (pet) {
      Pets.dog => localizations.dog,
      Pets.cat => localizations.cat,
      Pets.hamster => localizations.hamster,
      Pets.guineaPig => localizations.guineaPig,
      Pets.rabbit => localizations.rabbit,
      Pets.horse => localizations.horse,
    };
  }

  String getPetImage(Pets pet) {
    return switch (pet) {
      Pets.dog => AppImages.dog,
      Pets.cat => AppImages.cat,
      Pets.hamster => AppImages.hamster,
      Pets.guineaPig => AppImages.guineaPig,
      Pets.rabbit => AppImages.rabbit,
      Pets.horse => AppImages.horse,
    };
  }
}
