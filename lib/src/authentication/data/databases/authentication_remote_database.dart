import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:fur/src/authentication/domain/entities/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationRemoteDatabase {
  Future<User> authenticateWithGoogle();

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
  Future<User> authenticateWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    return User.empty();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    return;
  }
}
