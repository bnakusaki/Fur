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
  String get species => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  Sex get sex => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;
  Map<DateTime, double> get weight =>
      throw _privateConstructorUsedError; // Appearance
  ///
  ///
  String get image => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get markings => throw _privateConstructorUsedError;
  double? get size => throw _privateConstructorUsedError;
  DateTime get createdOn => throw _privateConstructorUsedError;
  DateTime get updatedOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String id,
      String owner,
      String name,
      String species,
      String breed,
      Sex sex,
      DateTime dob,
      Map<DateTime, double> weight,
      String image,
      String? color,
      String? markings,
      double? size,
      DateTime createdOn,
      DateTime updatedOn});
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
    Object? species = null,
    Object? breed = null,
    Object? sex = null,
    Object? dob = null,
    Object? weight = null,
    Object? image = null,
    Object? color = freezed,
    Object? markings = freezed,
    Object? size = freezed,
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
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, double>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      markings: freezed == markings
          ? _value.markings
          : markings // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
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
      String species,
      String breed,
      Sex sex,
      DateTime dob,
      Map<DateTime, double> weight,
      String image,
      String? color,
      String? markings,
      double? size,
      DateTime createdOn,
      DateTime updatedOn});
}

/// @nodoc
class __$$PetImplCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$PetImpl>
    implements _$$PetImplCopyWith<$Res> {
  __$$PetImplCopyWithImpl(_$PetImpl _value, $Res Function(_$PetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? owner = null,
    Object? name = null,
    Object? species = null,
    Object? breed = null,
    Object? sex = null,
    Object? dob = null,
    Object? weight = null,
    Object? image = null,
    Object? color = freezed,
    Object? markings = freezed,
    Object? size = freezed,
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
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _value._weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, double>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      markings: freezed == markings
          ? _value.markings
          : markings // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double?,
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
      required this.species,
      required this.breed,
      required this.sex,
      required this.dob,
      required final Map<DateTime, double> weight,
      required this.image,
      required this.color,
      required this.markings,
      required this.size,
      required this.createdOn,
      required this.updatedOn})
      : _weight = weight;

  factory _$PetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetImplFromJson(json);

  @override
  final String id;
  @override
  final String owner;
  @override
  final String name;
  @override
  final String species;
  @override
  final String breed;
  @override
  final Sex sex;
  @override
  final DateTime dob;
  final Map<DateTime, double> _weight;
  @override
  Map<DateTime, double> get weight {
    if (_weight is EqualUnmodifiableMapView) return _weight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weight);
  }

// Appearance
  ///
  ///
  @override
  final String image;
  @override
  final String? color;
  @override
  final String? markings;
  @override
  final double? size;
  @override
  final DateTime createdOn;
  @override
  final DateTime updatedOn;

  @override
  String toString() {
    return 'Pet(id: $id, owner: $owner, name: $name, species: $species, breed: $breed, sex: $sex, dob: $dob, weight: $weight, image: $image, color: $color, markings: $markings, size: $size, createdOn: $createdOn, updatedOn: $updatedOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            const DeepCollectionEquality().equals(other._weight, _weight) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.markings, markings) ||
                other.markings == markings) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      owner,
      name,
      species,
      breed,
      sex,
      dob,
      const DeepCollectionEquality().hash(_weight),
      image,
      color,
      markings,
      size,
      createdOn,
      updatedOn);

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
      required final String species,
      required final String breed,
      required final Sex sex,
      required final DateTime dob,
      required final Map<DateTime, double> weight,
      required final String image,
      required final String? color,
      required final String? markings,
      required final double? size,
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
  String get species;
  @override
  String get breed;
  @override
  Sex get sex;
  @override
  DateTime get dob;
  @override
  Map<DateTime, double> get weight;
  @override // Appearance
  ///
  ///
  String get image;
  @override
  String? get color;
  @override
  String? get markings;
  @override
  double? get size;
  @override
  DateTime get createdOn;
  @override
  DateTime get updatedOn;
  @override
  @JsonKey(ignore: true)
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
