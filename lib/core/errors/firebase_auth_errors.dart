import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';

class FirebaseAuthErrors extends Failure {
  FirebaseAuthErrors({required super.errorMessage});

  factory FirebaseAuthErrors.fromFirebaseAuthException({
    required FirebaseAuthException e,
  }) {
    switch (e.code) {
      case 'user-not-found':
        return FirebaseAuthErrors(
          errorMessage: 'No user found for that email.',
        );

      case 'wrong-password':
        return FirebaseAuthErrors(errorMessage: 'Wrong password provided.');

      case 'weak-password':
        return FirebaseAuthErrors(errorMessage: 'The password is too weak.');
      case 'email-already-in-use':
        return FirebaseAuthErrors(
          errorMessage: 'This email is already in use.',
        );

      case 'invalid-email':
        return FirebaseAuthErrors(errorMessage: 'Invalid email address.');

      case 'network-request-failed':
        return FirebaseAuthErrors(
          errorMessage: 'Network error. Check your connection.',
        );

      default:
        return FirebaseAuthErrors(
          errorMessage: e.message ?? 'An unexpected error occurred.',
        );
    }
  }
}
