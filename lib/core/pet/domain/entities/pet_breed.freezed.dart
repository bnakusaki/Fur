// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_breed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetBreed _$PetBreedFromJson(Map<String, dynamic> json) {
  return _PetBreed.fromJson(json);
}

/// @nodoc
mixin _$PetBreed {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetBreedCopyWith<PetBreed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetBreedCopyWith<$Res> {
  factory $PetBreedCopyWith(PetBreed value, $Res Function(PetBreed) then) =
      _$PetBreedCopyWithImpl<$Res, PetBreed>;
  @useResult
  $Res call({String id, String name, String photoUrl});
}

/// @nodoc
class _$PetBreedCopyWithImpl<$Res, $Val extends PetBreed>
    implements $PetBreedCopyWith<$Res> {
  _$PetBreedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
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
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetBreedImplCopyWith<$Res>
    implements $PetBreedCopyWith<$Res> {
  factory _$$PetBreedImplCopyWith(
          _$PetBreedImpl value, $Res Function(_$PetBreedImpl) then) =
      __$$PetBreedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String photoUrl});
}

/// @nodoc
class __$$PetBreedImplCopyWithImpl<$Res>
    extends _$PetBreedCopyWithImpl<$Res, _$PetBreedImpl>
    implements _$$PetBreedImplCopyWith<$Res> {
  __$$PetBreedImplCopyWithImpl(
      _$PetBreedImpl _value, $Res Function(_$PetBreedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? photoUrl = null,
  }) {
    return _then(_$PetBreedImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetBreedImpl implements _PetBreed {
  const _$PetBreedImpl(
      {required this.id, required this.name, required this.photoUrl});

  factory _$PetBreedImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetBreedImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String photoUrl;

  @override
  String toString() {
    return 'PetBreed(id: $id, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetBreedImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetBreedImplCopyWith<_$PetBreedImpl> get copyWith =>
      __$$PetBreedImplCopyWithImpl<_$PetBreedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetBreedImplToJson(
      this,
    );
  }
}

abstract class _PetBreed implements PetBreed {
  const factory _PetBreed(
      {required final String id,
      required final String name,
      required final String photoUrl}) = _$PetBreedImpl;

  factory _PetBreed.fromJson(Map<String, dynamic> json) =
      _$PetBreedImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$PetBreedImplCopyWith<_$PetBreedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
