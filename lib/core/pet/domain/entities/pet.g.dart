// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      owner: json['owner'] as String,
      name: json['name'] as String,
      breed: PetBreed.fromJson(json['breed'] as Map<String, dynamic>),
      gender: $enumDecode(_$PetGenderEnumMap, json['gender']),
      dob: DateTime.parse(json['dob'] as String),
      adoptionDate: json['adoptionDate'] == null
          ? null
          : DateTime.parse(json['adoptionDate'] as String),
      weight: PetWeight.fromJson(json['weight'] as Map<String, dynamic>),
      appearance:
          PetAppearance.fromJson(json['appearance'] as Map<String, dynamic>),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      createdOn: DateTime.parse(json['createdOn'] as String),
      updatedOn: DateTime.parse(json['updatedOn'] as String),
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'breed': instance.breed.toJson(),
      'gender': _$PetGenderEnumMap[instance.gender]!,
      'dob': instance.dob.toIso8601String(),
      'adoptionDate': instance.adoptionDate?.toIso8601String(),
      'weight': instance.weight.toJson(),
      'appearance': instance.appearance.toJson(),
      'images': instance.images,
      'createdOn': instance.createdOn.toIso8601String(),
      'updatedOn': instance.updatedOn.toIso8601String(),
    };

const _$PetGenderEnumMap = {
  PetGender.male: 'male',
  PetGender.female: 'female',
};
