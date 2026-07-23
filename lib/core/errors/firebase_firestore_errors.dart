import 'package:firebase_core/firebase_core.dart';
import 'package:swap_skill/core/errors/failure.dart';

class FirebaseFirestoreErrors extends Failure {
  FirebaseFirestoreErrors({required super.errorMessage});

  factory FirebaseFirestoreErrors.fromFirebaseException(FirebaseException e){
    switch(e.code){
      case 'permission-denied':
        return FirebaseFirestoreErrors( errorMessage: 'Permission denied.');
      case 'unavailable':
        return FirebaseFirestoreErrors(errorMessage:  'Service unavailable.');
      case 'not-found':
        return FirebaseFirestoreErrors(errorMessage:  'Document not found.');
      default:
        return FirebaseFirestoreErrors(errorMessage:  e.message ?? 'Unknown Firestore error.');
    }
  }
}