import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/pet/domain/entities/pet_appearance.dart';
import 'package:fur/core/pet/domain/entities/pet_weight.dart';
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
    required PetWeight weight,
    required String? story,
    required PetAppearance appearance,
    required String image,
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
      story: null,
      sex: Sex.male,
      appearance: PetAppearance.empty(),
      image: '',
      dob: DateTime.now(),
      weight: PetWeight.empty(),
      createdOn: DateTime.now(),
      updatedOn: DateTime.now(),
    );
  }
}
