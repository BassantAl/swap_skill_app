import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/core/errors/firebase_firestore_errors.dart';
import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/core/services/local_storage_services.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/data/repos/skills_setup_repo.dart';

class SkillsSetupRepoImpl implements SkillsSetupRepo {
  SkillsSetupRepoImpl({
    required this.firebaseFirestoreServices,
    required this.localStorageServices,
  });
  final FirebaseFirestoreServices firebaseFirestoreServices;
  final LocalStorageServices localStorageServices;

  static const String categoriesKey = 'categories';

  @override
Future<Either<Failure, List<CategoriesModel>>> getAllCategories() async {
  try {
    final hasLocalData = localStorageServices.containsKey(
      key: categoriesKey,
    );

    if (hasLocalData) {
      final localData = localStorageServices.getData(
        key: categoriesKey,
      );

      if (localData != null) {
        final categories = (localData as List)
            .map(
              (category) => CategoriesModel.fromMap(
                Map<String, dynamic>.from(
                  category as Map,
                ),
              ),
            )
            .toList();

        return right(categories);
      }
    }

    final result =
        await firebaseFirestoreServices.getAllCategories();

    final categories = result
        .map(
          (category) => category.toMap(),
        )
        .toList();

    await localStorageServices.saveData(
      key: categoriesKey,
      value: categories,
    );

    return right(result);
  } on FirebaseException catch (e) {
    final error =
        FirebaseFirestoreErrors.fromFirebaseException(e);

    return left(error);
  } catch (e) {

    return left(
      Failure(
        errorMessage: e.toString(),
      ),
    );
  }
}
 
@override
Future<Either<Failure, CategoriesModel>> getOneCategory({
  required String id,
}) async {
  try {
    final localData = localStorageServices.getData(
      key: categoriesKey,
    );

    if (localData == null) {
      return left(
        Failure(
          errorMessage: 'Categories not found locally',
        ),
      );
    }

    final categories = (localData as List)
        .map(
          (category) => CategoriesModel.fromMap(
            Map<String, dynamic>.from(
              category as Map,
            ),
          ),
        )
        .toList();

    for (final category in categories) {
      if (category.name == id) {
        return right(category);
      }
    }

    return left(
      Failure(
        errorMessage: 'Category not found',
      ),
    );
  } catch (e) {

    return left(
      Failure(
        errorMessage: e.toString(),
      ),
    );
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
