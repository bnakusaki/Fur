// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      owner: json['owner'] as String,
      sex: $enumDecode(_$SexEnumMap, json['sex']),
      breed: json['breed'] as String,
      image: json['image'] as String,
      species: json['species'] as String,
      weight: (json['weight'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(DateTime.parse(k), (e as num).toDouble()),
      ),
      dob: DateTime.parse(json['dob'] as String),
      color: json['color'] as String?,
      markings: json['markings'] as String?,
      size: (json['size'] as num?)?.toDouble(),
      createdOn: DateTime.parse(json['createdOn'] as String),
      updatedOn: DateTime.parse(json['updatedOn'] as String),
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner': instance.owner,
      'sex': _$SexEnumMap[instance.sex]!,
      'breed': instance.breed,
      'image': instance.image,
      'species': instance.species,
      'weight': instance.weight.map((k, e) => MapEntry(k.toIso8601String(), e)),
      'dob': instance.dob.toIso8601String(),
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
