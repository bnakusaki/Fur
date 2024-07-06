import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_weight_target.freezed.dart';
part 'pet_weight_target.g.dart';

@freezed
class PetWeightTarget with _$PetWeightTarget {
  const factory PetWeightTarget({
    required double target,
    required DateTime date,
  }) = _PetWeightTarget;

  factory PetWeightTarget.fromJson(Map<String, dynamic> json) => _$PetWeightTargetFromJson(json);

  factory PetWeightTarget.empty() {
    return PetWeightTarget(
      target: 0,
      date: DateTime.now(),
    );
  }
}
