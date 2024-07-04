// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_appearance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetAppearance _$PetAppearanceFromJson(Map<String, dynamic> json) {
  return _PetAppearance.fromJson(json);
}

/// @nodoc
mixin _$PetAppearance {
  String get color => throw _privateConstructorUsedError;
  String? get markings => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetAppearanceCopyWith<PetAppearance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetAppearanceCopyWith<$Res> {
  factory $PetAppearanceCopyWith(
          PetAppearance value, $Res Function(PetAppearance) then) =
      _$PetAppearanceCopyWithImpl<$Res, PetAppearance>;
  @useResult
  $Res call({String color, String? markings, String? description});
}

/// @nodoc
class _$PetAppearanceCopyWithImpl<$Res, $Val extends PetAppearance>
    implements $PetAppearanceCopyWith<$Res> {
  _$PetAppearanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? markings = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      markings: freezed == markings
          ? _value.markings
          : markings // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetAppearanceImplCopyWith<$Res>
    implements $PetAppearanceCopyWith<$Res> {
  factory _$$PetAppearanceImplCopyWith(
          _$PetAppearanceImpl value, $Res Function(_$PetAppearanceImpl) then) =
      __$$PetAppearanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String color, String? markings, String? description});
}

/// @nodoc
class __$$PetAppearanceImplCopyWithImpl<$Res>
    extends _$PetAppearanceCopyWithImpl<$Res, _$PetAppearanceImpl>
    implements _$$PetAppearanceImplCopyWith<$Res> {
  __$$PetAppearanceImplCopyWithImpl(
      _$PetAppearanceImpl _value, $Res Function(_$PetAppearanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = null,
    Object? markings = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PetAppearanceImpl(
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      markings: freezed == markings
          ? _value.markings
          : markings // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetAppearanceImpl implements _PetAppearance {
  const _$PetAppearanceImpl(
      {required this.color, required this.markings, required this.description});

  factory _$PetAppearanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetAppearanceImplFromJson(json);

  @override
  final String color;
  @override
  final String? markings;
  @override
  final String? description;

  @override
  String toString() {
    return 'PetAppearance(color: $color, markings: $markings, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetAppearanceImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.markings, markings) ||
                other.markings == markings) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, color, markings, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetAppearanceImplCopyWith<_$PetAppearanceImpl> get copyWith =>
      __$$PetAppearanceImplCopyWithImpl<_$PetAppearanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetAppearanceImplToJson(
      this,
    );
  }
}

abstract class _PetAppearance implements PetAppearance {
  const factory _PetAppearance(
      {required final String color,
      required final String? markings,
      required final String? description}) = _$PetAppearanceImpl;

  factory _PetAppearance.fromJson(Map<String, dynamic> json) =
      _$PetAppearanceImpl.fromJson;

  @override
  String get color;
  @override
  String? get markings;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$PetAppearanceImplCopyWith<_$PetAppearanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
