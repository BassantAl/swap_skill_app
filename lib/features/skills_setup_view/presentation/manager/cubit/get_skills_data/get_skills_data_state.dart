part of 'get_skills_data_cubit.dart';

@immutable
sealed class GetSkillsDataState {}

final class GetSkillsDataInitial extends GetSkillsDataState {}

final class GetSkillsDataSuccess extends GetSkillsDataState {
  final List<CategoriesModel> skills;
  GetSkillsDataSuccess({required this.skills});
}

final class GetSkillsDataFailure extends GetSkillsDataState {
  final String errorMessage;
  GetSkillsDataFailure({required this.errorMessage});
}

final class GetSkillsDataLoading extends GetSkillsDataState {}
