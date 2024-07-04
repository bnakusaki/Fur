import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_appearance.freezed.dart';
part 'pet_appearance.g.dart';

@freezed
class PetAppearance with _$PetAppearance {
  const factory PetAppearance({
    required String color,
    required String markings,
    required String size,
  }) = _PetAppearance;

  factory PetAppearance.fromJson(Map<String, dynamic> json) => _$PetAppearanceFromJson(json);

  factory PetAppearance.empty() {
    return const PetAppearance(
      color: '',
      markings: '',
      size: '',
    );
  }
}
