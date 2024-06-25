// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_age.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetAgeImpl _$$PetAgeImplFromJson(Map<String, dynamic> json) => _$PetAgeImpl(
      updatedOn: DateTime.parse(json['updatedOn'] as String),
      dob: DateTime.parse(json['dob'] as String),
    );

Map<String, dynamic> _$$PetAgeImplToJson(_$PetAgeImpl instance) =>
    <String, dynamic>{
      'updatedOn': instance.updatedOn.toIso8601String(),
      'dob': instance.dob.toIso8601String(),
    };
