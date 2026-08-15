part of 'remove_skill_cubit.dart';

@immutable
sealed class RemoveSkillState {}

final class RemoveSkillInitial extends RemoveSkillState {}


final class RemoveSkillLoading extends RemoveSkillState {}

final class RemoveSkillSuccess extends RemoveSkillState {
  RemoveSkillSuccess({
    required this.skill,
  });

  final String skill;
}

final class RemoveSkillFailure extends RemoveSkillState {
  RemoveSkillFailure({
    required this.errorMessage,
  });

  final String errorMessage;
}