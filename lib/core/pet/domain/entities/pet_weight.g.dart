// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_weight.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetWeightImpl _$$PetWeightImplFromJson(Map<String, dynamic> json) =>
    _$PetWeightImpl(
      weight: (json['weight'] as num).toDouble(),
      unit: $enumDecode(_$MassUnitEnumMap, json['unit']),
    );

Map<String, dynamic> _$$PetWeightImplToJson(_$PetWeightImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'unit': _$MassUnitEnumMap[instance.unit]!,
    };

const _$MassUnitEnumMap = {
  MassUnit.kg: 'kg',
  MassUnit.lb: 'lb',
};
