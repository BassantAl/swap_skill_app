import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';

class SkillsSetupRepoImpl implements SkillsSetupRepo {
  SkillsSetupRepoImpl({required this.firebaseFirestoreServices});
  final FirebaseFirestoreServices firebaseFirestoreServices;

  @override
  Future<Either<Failure, List<CategoriesModel>>> getSkillsData() async {
    try {
      final result = await firebaseFirestoreServices.readData();
      return right(result);
    } on FirebaseException catch (e) {
      var error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoriesModel>> getCategory({required String id}) async {
    try {
      final result = await firebaseFirestoreServices.getCategory(id: id);
      return right(result);
    } on FirebaseException catch (e) {
      var error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

@override
Future<Either<Failure, void>> addSelectedSkills({
  required List<String> selectedSkills,
  required String fieldName,
}) async {
  try {
    await firebaseFirestoreServices.addSelectedSkills(
      selectedSkills: selectedSkills,
      fieldName: fieldName,
    );

    return const Right(null);
  } on FirebaseException catch (e) {
      var error = FirebaseFirestoreErrors.fromFirebaseException(e);
      return left(error);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
}
  
}
