// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Breed _$BreedFromJson(Map<String, dynamic> json) {
  return _Breed.fromJson(json);
}

/// @nodoc
mixin _$Breed {
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get animal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BreedCopyWith<Breed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreedCopyWith<$Res> {
  factory $BreedCopyWith(Breed value, $Res Function(Breed) then) =
      _$BreedCopyWithImpl<$Res, Breed>;
  @useResult
  $Res call({String name, String imageUrl, String animal});
}

/// @nodoc
class _$BreedCopyWithImpl<$Res, $Val extends Breed>
    implements $BreedCopyWith<$Res> {
  _$BreedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? animal = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      animal: null == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BreedImplCopyWith<$Res> implements $BreedCopyWith<$Res> {
  factory _$$BreedImplCopyWith(
          _$BreedImpl value, $Res Function(_$BreedImpl) then) =
      __$$BreedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String imageUrl, String animal});
}

/// @nodoc
class __$$BreedImplCopyWithImpl<$Res>
    extends _$BreedCopyWithImpl<$Res, _$BreedImpl>
    implements _$$BreedImplCopyWith<$Res> {
  __$$BreedImplCopyWithImpl(
      _$BreedImpl _value, $Res Function(_$BreedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? imageUrl = null,
    Object? animal = null,
  }) {
    return _then(_$BreedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      animal: null == animal
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BreedImpl implements _Breed {
  const _$BreedImpl(
      {required this.name, required this.imageUrl, required this.animal});

  factory _$BreedImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreedImplFromJson(json);

  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String animal;

  @override
  String toString() {
    return 'Breed(name: $name, imageUrl: $imageUrl, animal: $animal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreedImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.animal, animal) || other.animal == animal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, imageUrl, animal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BreedImplCopyWith<_$BreedImpl> get copyWith =>
      __$$BreedImplCopyWithImpl<_$BreedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreedImplToJson(
      this,
    );
  }
}

abstract class _Breed implements Breed {
  const factory _Breed(
      {required final String name,
      required final String imageUrl,
      required final String animal}) = _$BreedImpl;

  factory _Breed.fromJson(Map<String, dynamic> json) = _$BreedImpl.fromJson;

  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get animal;
  @override
  @JsonKey(ignore: true)
  _$$BreedImplCopyWith<_$BreedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
