import 'package:dartz/dartz.dart';
import 'package:swap_skill/core/errors/failure.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';

abstract class SkillsSetupRepo {
  Future<Either<Failure, List<CategoriesModel>>> getSkillsData();
  Future<Either<Failure, CategoriesModel>> getCategory({required String id});

Future<Either<Failure, void>> addSelectedSkills({
  required List<String> selectedSkills,
  required String fieldName,
});
}
