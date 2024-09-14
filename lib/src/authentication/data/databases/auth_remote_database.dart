import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDatabase {
  Future<AuthResponse> signInWithGoogle();
}

class AuthRemoteDatabaseImpl implements AuthRemoteDatabase {
  final _supabase = Supabase.instance.client;

  @override
  Future<AuthResponse> signInWithGoogle() async {
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = '1028694549210-8k9u6qo9cmae5h00vfuaibpvvq5uqod0.apps.googleusercontent.com';

    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = '1028694549210-49n51affadjsgfuvf33l1f4ii3pqm1un.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}
