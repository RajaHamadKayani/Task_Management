import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the Facebook login flow
      final LoginResult result = await FacebookAuth.instance.login();

      // Check if the login was successful
      if (result.status == LoginStatus.success) {
        // Get the Facebook access token
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Sign in with Firebase using the Facebook access token
        return await _auth.signInWithCredential(credential);
      }

      // If login failed or was canceled
      return null;
    } catch (e) {
      print("Error signing in with Facebook: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }
}
