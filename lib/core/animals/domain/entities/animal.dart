import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';
part 'animal.g.dart';

@freezed
class Animal with _$Animal {
  const factory Animal({
    required String id,
    required String name,
    required String imageUrl,
  }) = _Animal;

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  factory Animal.empty() => const Animal(
        id: '',
        name: '',
        imageUrl: '',
      );
}
