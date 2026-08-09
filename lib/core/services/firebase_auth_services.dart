import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  var instance = FirebaseAuth.instance;
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  Future<UserCredential> signup({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  Future<void> resetPassord({required String email}) async {
    await instance.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize();
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate();
    if (googleUser == null) {
      throw Exception('Google sign in was cancelled.');
    }
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await instance.signInWithCredential(
      credential,
    );
    return userCredential;
  }

  Future<UserCredential> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
      return instance.signInWithCredential(credential);
    } else if (loginResult.status == LoginStatus.cancelled) {
      throw Exception('Facebook sign in was cancelled by the user.');
    } else {
      throw Exception(loginResult.message ?? 'Facebook sign in failed.');
    }
  }

  User? get currentUser {
    return instance.currentUser;
  }
}
