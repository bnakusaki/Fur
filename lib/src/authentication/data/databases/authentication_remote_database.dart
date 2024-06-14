import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fur/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRemoteDatabase {
  Future<User> signUp(
    String firstName,
    String lastName,
    String middleName,
    String email,
    String password,
  );

  Future<User> signIn(String email, String password);
}

class AuthenticationRemoteDatabaseImpl implements AuthenticationRemoteDatabase {
  @override
  Future<User> signIn(String email, String password) async {
    final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // TODO: implement
    return User.empty();
  }

  @override
  Future<User> signUp(
    String firstName,
    String lastName,
    String middleName,
    String email,
    String password,
  ) async {
    final response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // TODO: implement
    return User.empty();
  }
}
