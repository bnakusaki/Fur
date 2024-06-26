import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_age.freezed.dart';
part 'pet_age.g.dart';

@freezed
class PetAge with _$PetAge {
  @JsonSerializable(explicitToJson: true)
  const factory PetAge({
    required DateTime updatedOn,
    required DateTime dob,
  }) = _PetAge;

  factory PetAge.fromJson(Map<String, dynamic> json) => _$PetAgeFromJson(json);

  factory PetAge.empty() => PetAge(
        updatedOn: DateTime.now(),
        dob: DateTime.now(),
      );
}
