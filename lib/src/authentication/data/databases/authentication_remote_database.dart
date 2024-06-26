import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthenticationRemoteDatabase {
  Future<User> authenticateWithGoogle();
  Future<User> authenticateWithFacebook();
  Future<User> authenticateWithApple();
  Future<void> signOut();
}

class AuthenticationRemoteDatabaseImpl implements AuthenticationRemoteDatabase {
  @override
  Future<User> authenticateWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final response = await FirebaseAuth.instance.signInWithCredential(credential);
    return response.user!;
  }

  @override
  Future<User> authenticateWithApple() async {
    final appleProvider = AppleAuthProvider();
    final response = await FirebaseAuth.instance.signInWithProvider(appleProvider);
    return response.user!;
  }

  @override
  Future<User> authenticateWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    final response = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    return response.user!;
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    return;
  }
}
