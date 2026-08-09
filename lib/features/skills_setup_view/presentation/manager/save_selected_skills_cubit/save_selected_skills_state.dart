part of 'save_selected_skills_cubit.dart';

@immutable
sealed class SaveSelectedSkillsState {}

final class SaveSelectedSkillsInitial extends SaveSelectedSkillsState {}

final class SaveSelectedSkillsLoading extends SaveSelectedSkillsState {}

final class SaveSelectedSkillsSuccess extends SaveSelectedSkillsState {}

final class SaveSelectedSkillsFailure extends SaveSelectedSkillsState {
  SaveSelectedSkillsFailure({required this.errorMessage});
  final String errorMessage;
}
