// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
mixin _$Pet {
  String get id => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PetBreed get breed => throw _privateConstructorUsedError;
  PetGender get gender => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;
  DateTime? get adoptionDate => throw _privateConstructorUsedError;
  PetWeight get weight => throw _privateConstructorUsedError;
  PetAppearance get appearance => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  DateTime get createdOn => throw _privateConstructorUsedError;
  DateTime get updatedOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) = _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String id,
      String owner,
      String name,
      PetBreed breed,
      PetGender gender,
      DateTime dob,
      DateTime? adoptionDate,
      PetWeight weight,
      PetAppearance appearance,
      List<String> images,
      DateTime createdOn,
      DateTime updatedOn});

  $PetBreedCopyWith<$Res> get breed;
  $PetWeightCopyWith<$Res> get weight;
  $PetAppearanceCopyWith<$Res> get appearance;
}

/// @nodoc
class _$PetCopyWithImpl<$Res, $Val extends Pet> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? name = null,
    Object? breed = null,
    Object? gender = null,
    Object? dob = null,
    Object? adoptionDate = freezed,
    Object? weight = null,
    Object? appearance = null,
    Object? images = null,
    Object? createdOn = null,
    Object? updatedOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as PetBreed,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adoptionDate: freezed == adoptionDate
          ? _value.adoptionDate
          : adoptionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as PetWeight,
      appearance: null == appearance
          ? _value.appearance
          : appearance // ignore: cast_nullable_to_non_nullable
              as PetAppearance,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PetBreedCopyWith<$Res> get breed {
    return $PetBreedCopyWith<$Res>(_value.breed, (value) {
      return _then(_value.copyWith(breed: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PetWeightCopyWith<$Res> get weight {
    return $PetWeightCopyWith<$Res>(_value.weight, (value) {
      return _then(_value.copyWith(weight: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PetAppearanceCopyWith<$Res> get appearance {
    return $PetAppearanceCopyWith<$Res>(_value.appearance, (value) {
      return _then(_value.copyWith(appearance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PetImplCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$$PetImplCopyWith(_$PetImpl value, $Res Function(_$PetImpl) then) =
      __$$PetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String owner,
      String name,
      PetBreed breed,
      PetGender gender,
      DateTime dob,
      DateTime? adoptionDate,
      PetWeight weight,
      PetAppearance appearance,
      List<String> images,
      DateTime createdOn,
      DateTime updatedOn});

  @override
  $PetBreedCopyWith<$Res> get breed;
  @override
  $PetWeightCopyWith<$Res> get weight;
  @override
  $PetAppearanceCopyWith<$Res> get appearance;
}

/// @nodoc
class __$$PetImplCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$PetImpl>
    implements _$$PetImplCopyWith<$Res> {
  __$$PetImplCopyWithImpl(_$PetImpl _value, $Res Function(_$PetImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? name = null,
    Object? breed = null,
    Object? gender = null,
    Object? dob = null,
    Object? adoptionDate = freezed,
    Object? weight = null,
    Object? appearance = null,
    Object? images = null,
    Object? createdOn = null,
    Object? updatedOn = null,
  }) {
    return _then(_$PetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as PetBreed,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      adoptionDate: freezed == adoptionDate
          ? _value.adoptionDate
          : adoptionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as PetWeight,
      appearance: null == appearance
          ? _value.appearance
          : appearance // ignore: cast_nullable_to_non_nullable
              as PetAppearance,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PetImpl implements _Pet {
  const _$PetImpl(
      {required this.id,
      required this.owner,
      required this.name,
      required this.breed,
      required this.gender,
      required this.dob,
      required this.adoptionDate,
      required this.weight,
      required this.appearance,
      required final List<String> images,
      required this.createdOn,
      required this.updatedOn})
      : _images = images;

  factory _$PetImpl.fromJson(Map<String, dynamic> json) => _$$PetImplFromJson(json);

  @override
  final String id;
  @override
  final String owner;
  @override
  final String name;
  @override
  final PetBreed breed;
  @override
  final PetGender gender;
  @override
  final DateTime dob;
  @override
  final DateTime? adoptionDate;
  @override
  final PetWeight weight;
  @override
  final PetAppearance appearance;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final DateTime createdOn;
  @override
  final DateTime updatedOn;

  @override
  String toString() {
    return 'Pet(id: $id, owner: $owner, name: $name, breed: $breed, gender: $gender, dob: $dob, adoptionDate: $adoptionDate, weight: $weight, appearance: $appearance, images: $images, createdOn: $createdOn, updatedOn: $updatedOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.adoptionDate, adoptionDate) || other.adoptionDate == adoptionDate) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.appearance, appearance) || other.appearance == appearance) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdOn, createdOn) || other.createdOn == createdOn) &&
            (identical(other.updatedOn, updatedOn) || other.updatedOn == updatedOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, owner, name, breed, gender, dob, adoptionDate,
      weight, appearance, const DeepCollectionEquality().hash(_images), createdOn, updatedOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      __$$PetImplCopyWithImpl<_$PetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetImplToJson(
      this,
    );
  }
}

abstract class _Pet implements Pet {
  const factory _Pet(
      {required final String id,
      required final String owner,
      required final String name,
      required final PetBreed breed,
      required final PetGender gender,
      required final DateTime dob,
      required final DateTime? adoptionDate,
      required final PetWeight weight,
      required final PetAppearance appearance,
      required final List<String> images,
      required final DateTime createdOn,
      required final DateTime updatedOn}) = _$PetImpl;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$PetImpl.fromJson;

  @override
  String get id;
  @override
  String get owner;
  @override
  String get name;
  @override
  PetBreed get breed;
  @override
  PetGender get gender;
  @override
  DateTime get dob;
  @override
  DateTime? get adoptionDate;
  @override
  PetWeight get weight;
  @override
  PetAppearance get appearance;
  @override
  List<String> get images;
  @override
  DateTime get createdOn;
  @override
  DateTime get updatedOn;
  @override
  @JsonKey(ignore: true)
  _$$PetImplCopyWith<_$PetImpl> get copyWith => throw _privateConstructorUsedError;
}
