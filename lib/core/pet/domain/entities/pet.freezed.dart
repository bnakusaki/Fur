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
  String get name => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  Sex get sex => throw _privateConstructorUsedError;
  String get breed => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get species => throw _privateConstructorUsedError;
  Map<DateTime, double> get weight => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get markings => throw _privateConstructorUsedError;
  double? get size => throw _privateConstructorUsedError;

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
      String name,
      String owner,
      Sex sex,
      String breed,
      String image,
      String species,
      Map<DateTime, double> weight,
      DateTime dob,
      String? color,
      String? markings,
      double? size});
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
    Object? name = null,
    Object? owner = null,
    Object? sex = null,
    Object? breed = null,
    Object? image = null,
    Object? species = null,
    Object? weight = null,
    Object? dob = null,
    Object? color = freezed,
    Object? markings = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, double>,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      String name,
      String owner,
      Sex sex,
      String breed,
      String image,
      String species,
      Map<DateTime, double> weight,
      DateTime dob,
      String? color,
      String? markings,
      double? size});
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
    Object? name = null,
    Object? owner = null,
    Object? sex = null,
    Object? breed = null,
    Object? image = null,
    Object? species = null,
    Object? weight = null,
    Object? dob = null,
    Object? color = freezed,
    Object? markings = freezed,
    Object? size = freezed,
  }) {
    return _then(_$PetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      sex: null == sex
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as Sex,
      breed: null == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value._weight
          : weight // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, double>,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PetImpl implements _Pet {
  const _$PetImpl(
      {required this.id,
      required this.name,
      required this.owner,
      required this.sex,
      required this.breed,
      required this.image,
      required this.species,
      required final Map<DateTime, double> weight,
      required this.dob,
      required this.color,
      required this.markings,
      required this.size})
      : _weight = weight;

  factory _$PetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String owner;
  @override
  final Sex sex;
  @override
  final String breed;
  @override
  final String image;
  @override
  final String species;
  final Map<DateTime, double> _weight;
  @override
  Map<DateTime, double> get weight {
    if (_weight is EqualUnmodifiableMapView) return _weight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weight);
  }

  @override
  final DateTime dob;
  @override
  final String? color;
  @override
  final String? markings;
  @override
  final double? size;

  @override
  String toString() {
    return 'Pet(id: $id, name: $name, owner: $owner, sex: $sex, breed: $breed, image: $image, species: $species, weight: $weight, dob: $dob, color: $color, markings: $markings, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.sex, sex) || other.sex == sex) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.species, species) || other.species == species) &&
            const DeepCollectionEquality().equals(other._weight, _weight) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.markings, markings) ||
                other.markings == markings) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      owner,
      sex,
      breed,
      image,
      species,
      const DeepCollectionEquality().hash(_weight),
      dob,
      color,
      markings,
      size);

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
      required final String name,
      required final String owner,
      required final Sex sex,
      required final String breed,
      required final String image,
      required final String species,
      required final Map<DateTime, double> weight,
      required final DateTime dob,
      required final String? color,
      required final String? markings,
      required final double? size}) = _$PetImpl;

  factory _Pet.fromJson(Map<String, dynamic> json) = _$PetImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get owner;
  @override
  Sex get sex;
  @override
  String get breed;
  @override
  String get image;
  @override
  String get species;
  @override
  Map<DateTime, double> get weight;
  @override
  DateTime get dob;
  @override
  String? get color;
  @override
  String? get markings;
  @override
  double? get size;
  @override
  @JsonKey(ignore: true)
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
