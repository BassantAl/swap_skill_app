
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_auth_errors.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.firebaseFirestoreServices,
  });
  final FirebaseAuthServices firebaseAuthServices;
  final FirebaseFirestoreServices firebaseFirestoreServices;
  
  @override
  Future<Either<Failure, UserCredential>> login({
    required String email,
    required String password,
  }) async {
    try {
      var result = await firebaseAuthServices.login(
        email: email,
        password: password,
      );
      return right(result);
    } on FirebaseAuthException catch (e) {
      var error = FirebaseAuthErrors.fromFirebaseAuthException(e: e);
      return left(error);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signup({
    required String email,
    required String password,
    required String fullName,
    required String userName,
  }) async {
    try {
      var userCredential = await firebaseAuthServices.signup(
        email: email,
        password: password,
      );

       await firebaseFirestoreServices.addUser(
        uid: userCredential.user!.uid,
        fullName: fullName,
        userName: userName,
        email: email,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      var error = FirebaseAuthErrors.fromFirebaseAuthException(e: e);
      return left(error);
    }on FirebaseException catch (e) {
      return left(FirebaseFirestoreErrors.fromFirebaseException(e));
    }
  }

  
}
