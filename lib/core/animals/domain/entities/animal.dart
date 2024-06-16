import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';

part 'animal.freezed.dart';
part 'animal.g.dart';

@freezed
class Animal with _$Animal {
  const factory Animal({
    required String id,
    required String name,
    required String imageUrl,
    required List<Breed> breeds,
  }) = _Animal;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  factory Animal.empty() => const Animal(
        id: '',
        name: '',
        imageUrl: '',
        breeds: [],
      );
}
