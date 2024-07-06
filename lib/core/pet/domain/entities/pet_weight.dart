import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fur/core/pet/domain/entities/pet_weight_target.dart';

part 'pet_weight.freezed.dart';
part 'pet_weight.g.dart';

@freezed
class PetWeight with _$PetWeight {
  const factory PetWeight({
    required Map<DateTime, double> history,
    required PetWeightTarget? target,
  }) = _PetWeight;

  factory PetWeight.fromJson(Map<String, dynamic> json) => _$PetWeightFromJson(json);

  factory PetWeight.empty() {
    return const PetWeight(
      history: {},
      target: null,
    );
  }
}
