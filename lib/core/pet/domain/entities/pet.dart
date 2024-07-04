import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  @JsonSerializable(explicitToJson: true)
  const factory Pet({
    required String id,
    required String owner,
    required String name,
    required String species,
    required String breed,
    required Sex sex,
    required DateTime dob,
    required Map<DateTime, double> weight,
    // Appearance

    ///

    ///
    required String image,
    required String? color,
    required String? markings,
    required double? size,
    required DateTime createdOn,
    required DateTime updatedOn,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  factory Pet.empty() {
    return Pet(
      id: '',
      owner: '',
      name: '',
      species: '',
      breed: '',
      sex: Sex.male,
      image: '',
      dob: DateTime.now(),
      weight: {},

      ///
      ///
      color: null,
      markings: null,
      size: null,
      createdOn: DateTime.now(),
      updatedOn: DateTime.now(),
    );
  }
}
