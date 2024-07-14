import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_breed.freezed.dart';
part 'pet_breed.g.dart';

@freezed
class PetBreed with _$PetBreed {
  const factory PetBreed({
    required String id,
    required String name,
    required String photoUrl,
  }) = _PetBreed;

  factory PetBreed.fromJson(Map<String, dynamic> json) => _$PetBreedFromJson(json);

  factory PetBreed.empty() {
    return const PetBreed(
      id: '',
      name: '',
      photoUrl: '',
    );
  }
}
