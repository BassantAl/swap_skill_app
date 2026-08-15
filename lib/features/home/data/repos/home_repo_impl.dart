import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl({required this.firebaseFirestoreServices});
  final FirebaseFirestoreServices firebaseFirestoreServices;
  @override
  Future<Either<Failure, void>> addNewSkill({
    required String skill,
    required String fieldName,
  }) async {
    try {
      await firebaseFirestoreServices.addNewSkill(
        skill: skill,
        fieldName: fieldName,
      );
      return right<Failure, void>(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeSkill({
    required String skill,
    required String fieldName,
  }) async {
    try {
      await firebaseFirestoreServices.removeSkill(
        skill: skill,
        fieldName: fieldName,
      );
      return right<Failure, void>(null);
    } on FirebaseException catch (e) {
      final error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
