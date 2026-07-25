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

      case 'missing-email':
        return FirebaseAuthErrors(
          errorMessage: 'Please enter your email address.',
        );

      case 'user-disabled':
        return FirebaseAuthErrors(
          errorMessage: 'This user account has been disabled.',
        );

      case 'too-many-requests':
        return FirebaseAuthErrors(
          errorMessage: 'Too many requests. Please try again later.',
        );

      case 'invalid-credential':
        return FirebaseAuthErrors(
          errorMessage: 'The provided credentials are invalid.',
        );

      case 'account-exists-with-different-credential':
        return FirebaseAuthErrors(
          errorMessage:
              'An account already exists with the same email using a different sign-in method.',
        );

      case 'operation-not-allowed':
        return FirebaseAuthErrors(
          errorMessage: 'This sign-in method is not enabled.',
        );


      default:
        return FirebaseAuthErrors(
          errorMessage: e.message ?? 'An unexpected error occurred.',
        );
    }
  }
}
