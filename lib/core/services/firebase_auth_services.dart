import 'package:firebase_auth/firebase_auth.dart';

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
}
