import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String firstName,
    required String? middleName,
    required String lastName,
    required String email,
    required String photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.empty() => const User(
        id: '',
        firstName: '',
        middleName: null,
        lastName: '',
        email: '',
        photoUrl: '',
      );
}
