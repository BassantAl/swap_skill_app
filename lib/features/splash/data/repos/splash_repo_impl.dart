import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_auth_services.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/splash/data/repos/splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  SplashRepoImpl({
    required this.firebaseAuthServices,
    required this.firebaseFirestoreServices,
  });
  final FirebaseAuthServices firebaseAuthServices;
  final FirebaseFirestoreServices firebaseFirestoreServices;
  @override
  User? get currentUser => firebaseAuthServices.currentUser;

  @override
  Future<Either<Failure, Map<String, dynamic>?>> getUserInfo() async {
    try {
      var result = await firebaseFirestoreServices.getUserInfo();
      return right(result);
    } on FirebaseException catch (e) {
      
      var error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
