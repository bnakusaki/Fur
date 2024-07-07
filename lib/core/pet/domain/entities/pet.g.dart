// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      owner: json['owner'] as String,
      name: json['name'] as String,
      species: json['species'] as String,
      breed: json['breed'] as String,
      sex: $enumDecode(_$SexEnumMap, json['sex']),
      dob: DateTime.parse(json['dob'] as String),
      weight: PetWeight.fromJson(json['weight'] as Map<String, dynamic>),
      story: json['story'] as String?,
      appearance:
          PetAppearance.fromJson(json['appearance'] as Map<String, dynamic>),
      image: json['image'] as String,
      createdOn: DateTime.parse(json['createdOn'] as String),
      updatedOn: DateTime.parse(json['updatedOn'] as String),
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'species': instance.species,
      'breed': instance.breed,
      'sex': _$SexEnumMap[instance.sex]!,
      'dob': instance.dob.toIso8601String(),
      'weight': instance.weight.toJson(),
      'story': instance.story,
      'appearance': instance.appearance.toJson(),
      'image': instance.image,
      'createdOn': instance.createdOn.toIso8601String(),
      'updatedOn': instance.updatedOn.toIso8601String(),
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
};
