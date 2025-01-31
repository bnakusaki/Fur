// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardingMessage {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingMessageCopyWith<OnboardingMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingMessageCopyWith<$Res> {
  factory $OnboardingMessageCopyWith(
          OnboardingMessage value, $Res Function(OnboardingMessage) then) =
      _$OnboardingMessageCopyWithImpl<$Res, OnboardingMessage>;
  @useResult
  $Res call({String title, String description, String image});
}

/// @nodoc
class _$OnboardingMessageCopyWithImpl<$Res, $Val extends OnboardingMessage>
    implements $OnboardingMessageCopyWith<$Res> {
  _$OnboardingMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingMessageImplCopyWith<$Res>
    implements $OnboardingMessageCopyWith<$Res> {
  factory _$$OnboardingMessageImplCopyWith(_$OnboardingMessageImpl value,
          $Res Function(_$OnboardingMessageImpl) then) =
      __$$OnboardingMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String image});
}

/// @nodoc
class __$$OnboardingMessageImplCopyWithImpl<$Res>
    extends _$OnboardingMessageCopyWithImpl<$Res, _$OnboardingMessageImpl>
    implements _$$OnboardingMessageImplCopyWith<$Res> {
  __$$OnboardingMessageImplCopyWithImpl(_$OnboardingMessageImpl _value,
      $Res Function(_$OnboardingMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? image = null,
  }) {
    return _then(_$OnboardingMessageImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnboardingMessageImpl implements _OnboardingMessage {
  _$OnboardingMessageImpl(
      {required this.title, required this.description, required this.image});

  @override
  final String title;
  @override
  final String description;
  @override
  final String image;

  @override
  String toString() {
    return 'OnboardingMessage(title: $title, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingMessageImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingMessageImplCopyWith<_$OnboardingMessageImpl> get copyWith =>
      __$$OnboardingMessageImplCopyWithImpl<_$OnboardingMessageImpl>(
          this, _$identity);
}

abstract class _OnboardingMessage implements OnboardingMessage {
  factory _OnboardingMessage(
      {required final String title,
      required final String description,
      required final String image}) = _$OnboardingMessageImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$OnboardingMessageImplCopyWith<_$OnboardingMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
