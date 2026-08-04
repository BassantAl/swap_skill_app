import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_skills_cubit_state.dart';

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
}
