import 'package:firebase_auth/firebase_auth.dart';
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
}
