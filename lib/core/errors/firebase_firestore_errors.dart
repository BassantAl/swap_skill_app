import 'package:firebase_core/firebase_core.dart';
import 'package:swap_skill/core/errors/failure.dart';

class FirebaseFirestoreErrors extends Failure {
  FirebaseFirestoreErrors({required super.errorMessage});

  factory FirebaseFirestoreErrors.fromFirebaseException(
      FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFirestoreErrors(
          errorMessage: 'Permission denied.',
        );

      case 'unauthenticated':
        return FirebaseFirestoreErrors(
          errorMessage: 'User is not authenticated.',
        );

      case 'not-found':
        return FirebaseFirestoreErrors(
          errorMessage: 'Document not found.',
        );

      case 'unavailable':
        return FirebaseFirestoreErrors(
          errorMessage: 'Firestore service is unavailable.',
        );

      case 'deadline-exceeded':
        return FirebaseFirestoreErrors(
          errorMessage: 'Request timed out.',
        );

      case 'cancelled':
        return FirebaseFirestoreErrors(
          errorMessage: 'Request was cancelled.',
        );

      case 'resource-exhausted':
        return FirebaseFirestoreErrors(
          errorMessage: 'Resource quota exceeded.',
        );

      case 'failed-precondition':
        return FirebaseFirestoreErrors(
          errorMessage: 'Operation failed due to a precondition.',
        );

      case 'aborted':
        return FirebaseFirestoreErrors(
          errorMessage: 'Operation was aborted.',
        );

      case 'internal':
        return FirebaseFirestoreErrors(
          errorMessage: 'Internal Firestore error.',
        );

      case 'unknown':
        return FirebaseFirestoreErrors(
          errorMessage: 'Unknown Firestore error.',
        );

      default:
        return FirebaseFirestoreErrors(
          errorMessage: e.message ?? 'Unexpected Firestore error.',
        );
    }
  }
}