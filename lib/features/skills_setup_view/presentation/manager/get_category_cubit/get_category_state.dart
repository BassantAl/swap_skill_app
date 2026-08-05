part of 'get_category_cubit.dart';

@immutable
sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {}

final class GetCategorySuccess extends GetCategoryState {
  final CategoriesModel categoriesModel;
  GetCategorySuccess({required this.categoriesModel});
}

final class GetCategoryFailure extends GetCategoryState {
  final String errorMessage;
  GetCategoryFailure({required this.errorMessage});
}

final class GetCategoryLoading extends GetCategoryState {}


