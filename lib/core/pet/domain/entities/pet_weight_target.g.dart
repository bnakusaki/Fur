// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_weight_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetWeightTargetImpl _$$PetWeightTargetImplFromJson(
        Map<String, dynamic> json) =>
    _$PetWeightTargetImpl(
      target: (json['target'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$PetWeightTargetImplToJson(
        _$PetWeightTargetImpl instance) =>
    <String, dynamic>{
      'target': instance.target,
      'date': instance.date.toIso8601String(),
    };
