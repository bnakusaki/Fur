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
  Future<void> signOut();
}

class AuthenticationRemoteDatabaseImpl implements AuthenticationRemoteDatabase {
  @override
  Future<User> signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

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
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirebaseAuth.instance.currentUser!.updateDisplayName(
      '$firstName $middleName $lastName',
    );

    return User.empty();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    return;
  }
}
