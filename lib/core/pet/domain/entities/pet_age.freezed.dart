// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_age.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetAge _$PetAgeFromJson(Map<String, dynamic> json) {
  return _PetAge.fromJson(json);
}

/// @nodoc
mixin _$PetAge {
  DateTime get updatedOn => throw _privateConstructorUsedError;
  DateTime get dob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetAgeCopyWith<PetAge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetAgeCopyWith<$Res> {
  factory $PetAgeCopyWith(PetAge value, $Res Function(PetAge) then) =
      _$PetAgeCopyWithImpl<$Res, PetAge>;
  @useResult
  $Res call({DateTime updatedOn, DateTime dob});
}

/// @nodoc
class _$PetAgeCopyWithImpl<$Res, $Val extends PetAge>
    implements $PetAgeCopyWith<$Res> {
  _$PetAgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedOn = null,
    Object? dob = null,
  }) {
    return _then(_value.copyWith(
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetAgeImplCopyWith<$Res> implements $PetAgeCopyWith<$Res> {
  factory _$$PetAgeImplCopyWith(
          _$PetAgeImpl value, $Res Function(_$PetAgeImpl) then) =
      __$$PetAgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime updatedOn, DateTime dob});
}

/// @nodoc
class __$$PetAgeImplCopyWithImpl<$Res>
    extends _$PetAgeCopyWithImpl<$Res, _$PetAgeImpl>
    implements _$$PetAgeImplCopyWith<$Res> {
  __$$PetAgeImplCopyWithImpl(
      _$PetAgeImpl _value, $Res Function(_$PetAgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedOn = null,
    Object? dob = null,
  }) {
    return _then(_$PetAgeImpl(
      updatedOn: null == updatedOn
          ? _value.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetAgeImpl implements _PetAge {
  const _$PetAgeImpl({required this.updatedOn, required this.dob});

  factory _$PetAgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetAgeImplFromJson(json);

  @override
  final DateTime updatedOn;
  @override
  final DateTime dob;

  @override
  String toString() {
    return 'PetAge(updatedOn: $updatedOn, dob: $dob)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetAgeImpl &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn) &&
            (identical(other.dob, dob) || other.dob == dob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, updatedOn, dob);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetAgeImplCopyWith<_$PetAgeImpl> get copyWith =>
      __$$PetAgeImplCopyWithImpl<_$PetAgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetAgeImplToJson(
      this,
    );
  }
}

abstract class _PetAge implements PetAge {
  const factory _PetAge(
      {required final DateTime updatedOn,
      required final DateTime dob}) = _$PetAgeImpl;

  factory _PetAge.fromJson(Map<String, dynamic> json) = _$PetAgeImpl.fromJson;

  @override
  DateTime get updatedOn;
  @override
  DateTime get dob;
  @override
  @JsonKey(ignore: true)
  _$$PetAgeImplCopyWith<_$PetAgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
