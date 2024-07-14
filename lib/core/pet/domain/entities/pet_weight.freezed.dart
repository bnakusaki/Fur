// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_weight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PetWeight _$PetWeightFromJson(Map<String, dynamic> json) {
  return _PetWeight.fromJson(json);
}

/// @nodoc
mixin _$PetWeight {
  double get weight => throw _privateConstructorUsedError;
  MassUnit get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetWeightCopyWith<PetWeight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetWeightCopyWith<$Res> {
  factory $PetWeightCopyWith(PetWeight value, $Res Function(PetWeight) then) =
      _$PetWeightCopyWithImpl<$Res, PetWeight>;
  @useResult
  $Res call({double weight, MassUnit unit});
}

/// @nodoc
class _$PetWeightCopyWithImpl<$Res, $Val extends PetWeight>
    implements $PetWeightCopyWith<$Res> {
  _$PetWeightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MassUnit,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetWeightImplCopyWith<$Res>
    implements $PetWeightCopyWith<$Res> {
  factory _$$PetWeightImplCopyWith(
          _$PetWeightImpl value, $Res Function(_$PetWeightImpl) then) =
      __$$PetWeightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double weight, MassUnit unit});
}

/// @nodoc
class __$$PetWeightImplCopyWithImpl<$Res>
    extends _$PetWeightCopyWithImpl<$Res, _$PetWeightImpl>
    implements _$$PetWeightImplCopyWith<$Res> {
  __$$PetWeightImplCopyWithImpl(
      _$PetWeightImpl _value, $Res Function(_$PetWeightImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = null,
    Object? unit = null,
  }) {
    return _then(_$PetWeightImpl(
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MassUnit,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PetWeightImpl implements _PetWeight {
  const _$PetWeightImpl({required this.weight, required this.unit});

  factory _$PetWeightImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetWeightImplFromJson(json);

  @override
  final double weight;
  @override
  final MassUnit unit;

  @override
  String toString() {
    return 'PetWeight(weight: $weight, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetWeightImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weight, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PetWeightImplCopyWith<_$PetWeightImpl> get copyWith =>
      __$$PetWeightImplCopyWithImpl<_$PetWeightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetWeightImplToJson(
      this,
    );
  }
}

abstract class _PetWeight implements PetWeight {
  const factory _PetWeight(
      {required final double weight,
      required final MassUnit unit}) = _$PetWeightImpl;

  factory _PetWeight.fromJson(Map<String, dynamic> json) =
      _$PetWeightImpl.fromJson;

  @override
  double get weight;
  @override
  MassUnit get unit;
  @override
  @JsonKey(ignore: true)
  _$$PetWeightImplCopyWith<_$PetWeightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
