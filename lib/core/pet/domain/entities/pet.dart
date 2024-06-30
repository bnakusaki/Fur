// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  @JsonSerializable(explicitToJson: true)
  const factory Pet({
    required String id,
    required String name,
    required String owner,
    required Sex sex,
    required String breed,
    required String image,
    required String species,
    required Map<DateTime, double> weight,
    required DateTime dob,
    required String? color,
    required String? markings,
    required double? size,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  factory Pet.empty() {
    return Pet(
      id: '',
      name: '',
      owner: '',
      sex: Sex.male,
      breed: '',
      image: '',
      species: '',
      weight: {},
      dob: DateTime.now(),
      color: null,
      markings: null,
      size: null,
    );
  }
}
