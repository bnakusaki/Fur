import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  User build() => User.empty();

  void set(User user) => state = user;
}
