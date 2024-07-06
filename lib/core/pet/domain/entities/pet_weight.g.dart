// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_weight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetWeightImpl _$$PetWeightImplFromJson(Map<String, dynamic> json) =>
    _$PetWeightImpl(
      history: (json['history'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(DateTime.parse(k), (e as num).toDouble()),
      ),
      target: json['target'] == null
          ? null
          : PetWeightTarget.fromJson(json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PetWeightImplToJson(_$PetWeightImpl instance) =>
    <String, dynamic>{
      'history':
          instance.history.map((k, e) => MapEntry(k.toIso8601String(), e)),
      'target': instance.target,
    };
