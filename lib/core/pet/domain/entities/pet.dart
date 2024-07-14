import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/pet/domain/entities/pet_appearance.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/core/pet/domain/entities/pet_weight.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  @JsonSerializable(explicitToJson: true)
  const factory Pet({
    required String id,
    required String owner,
    required String name,
    required PetBreed breed,
    required PetGender gender,
    required DateTime dob,
    required DateTime? adoptionDate,
    required PetWeight weight,
    required PetAppearance appearance,
    required List<String> images,
    required DateTime createdOn,
    required DateTime updatedOn,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  factory Pet.empty() {
    return Pet(
      id: '',
      owner: '',
      name: '',
      breed: PetBreed.empty(),
      gender: PetGender.male,
      appearance: PetAppearance.empty(),
      images: [],
      dob: DateTime.now(),
      adoptionDate: null,
      weight: PetWeight.empty(),
      createdOn: DateTime.now(),
      updatedOn: DateTime.now(),
    );
  }
}

enum PetGender { male, female }
