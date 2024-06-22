// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      owner: json['owner'] as String,
      dob: DateTime.parse(json['dob'] as String),
      sex: $enumDecode(_$SexEnumMap, json['sex']),
      breed: json['breed'] as String,
      image: json['image'] as String,
      animal: json['animal'] as String,
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'dob': instance.dob.toIso8601String(),
      'sex': _$SexEnumMap[instance.sex]!,
      'breed': instance.breed,
      'image': instance.image,
      'animal': instance.animal,
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
};
