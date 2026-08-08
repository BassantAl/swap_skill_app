import 'package:bloc/bloc.dart';


class SelectedSkillsCubit extends Cubit<List<String>> {
  SelectedSkillsCubit() : super([]);

  void toggleSkill({required String skill}) {
    var selected = List<String>.from(state);

    if (selected.contains(skill)) {
      selected.remove(skill);
    } else {
      selected.add(skill);
    }
    emit(selected);
  }

  void removeSkill(String skill) {
  final updatedSkills = List<String>.from(state);
  updatedSkills.remove(skill);
  emit(updatedSkills);
}
}
