import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_weight.freezed.dart';
part 'pet_weight.g.dart';

@freezed
class PetWeight with _$PetWeight {
  @JsonSerializable(explicitToJson: true)
  const factory PetWeight({
    required double weight,
    required MassUnit unit,
  }) = _PetWeight;

  factory PetWeight.fromJson(Map<String, dynamic> json) => _$PetWeightFromJson(json);

  factory PetWeight.empty() {
    return const PetWeight(
      weight: 0,
      unit: MassUnit.kg,
    );
  }
}

enum MassUnit { kg, lb }
