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
      weight: (json['weight'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(DateTime.parse(k), (e as num).toDouble()),
      ),
      image: json['image'] as String,
      color: json['color'] as String?,
      markings: json['markings'] as String?,
      size: (json['size'] as num?)?.toDouble(),
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
      'weight': instance.weight.map((k, e) => MapEntry(k.toIso8601String(), e)),
      'image': instance.image,
      'color': instance.color,
      'markings': instance.markings,
      'size': instance.size,
      'createdOn': instance.createdOn.toIso8601String(),
      'updatedOn': instance.updatedOn.toIso8601String(),
    };

const _$SexEnumMap = {
  Sex.male: 'male',
  Sex.female: 'female',
};
