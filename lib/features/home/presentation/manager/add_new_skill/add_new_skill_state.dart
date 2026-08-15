part of 'add_new_skill_cubit.dart';

@immutable
sealed class AddNewSkillState {}

final class AddNewSkillInitial extends AddNewSkillState {}

final class AddNewSkillLoading extends AddNewSkillState {}

final class AddNewSkillSuccess extends AddNewSkillState {
  AddNewSkillSuccess({
    required this.skill,
  });

  final String skill;
}

final class AddNewSkillFailure extends AddNewSkillState {
  AddNewSkillFailure({
    required this.errorMessage,
  });

  final String errorMessage;
}