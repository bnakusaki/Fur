import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/pet/domain/entities/sex.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

@freezed
class Pet with _$Pet {
  factory Pet({
    required String id,
    required String name,
    required String owner,
    required DateTime dob,
    required Sex sex,
    required String breed,
    required String image,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  factory Pet.empty() {
    return Pet(
      id: '',
      name: '',
      owner: '',
      dob: DateTime.now(),
      sex: Sex.male,
      breed: '',
      image: '',
    );
  }
}
