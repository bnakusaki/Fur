import 'package:flutter/material.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/src/pets/domain/entities/pet.dart';

mixin PetMixin {
  String getPetName(BuildContext context, Pet pet) {
    final localizations = AppLocalizations.of(context)!;

    return switch (pet) {
      Pet.dog => localizations.dog,
      Pet.cat => localizations.cat,
      Pet.hamster => localizations.hamster,
      Pet.guineaPig => localizations.guineaPig,
      Pet.rabbit => localizations.rabbit,
      Pet.horse => localizations.horse,
    };
  }

  String getPetImage(Pet pet) {
    return switch (pet) {
      Pet.dog => AppImages.dog,
      Pet.cat => AppImages.cat,
      Pet.hamster => AppImages.hamster,
      Pet.guineaPig => AppImages.guineaPig,
      Pet.rabbit => AppImages.rabbit,
      Pet.horse => AppImages.horse,
    };
  }
}
