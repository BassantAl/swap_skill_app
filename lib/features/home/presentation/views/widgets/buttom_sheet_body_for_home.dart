import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/buttom_sheet_body.dart';
import 'package:swap_skill/features/home/presentation/manager/add_new_skill/add_new_skill_cubit.dart';

class ButtomSheetBodyForHome extends StatefulWidget {
  const ButtomSheetBodyForHome({super.key, required this.isTeach, this.onTap});
  final bool isTeach;
  final void Function()? onTap;

  @override
  State<ButtomSheetBodyForHome> createState() =>
      _ButtomSheetBodyForHomeState();
}
class _ButtomSheetBodyForHomeState extends State<ButtomSheetBodyForHome> {
  GlobalKey<FormState> formKey = GlobalKey();
  String skill = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewSkillCubit, AddNewSkillState>(
      listener: (context, state) {
        if (state is AddNewSkillSuccess) {
          Navigator.of(context).pop(state.skill);
        }
      },
      child: ButtomSheetBody(
        formKey: formKey,
        onSavedSkill: (value) {
          skill = value!;
        },
        onTap: () {
          addSkill(context);
        },
      ),
    );
  }

  void addSkill(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    formKey.currentState!.save();

    context.read<AddNewSkillCubit>().addNewSkill(
      fieldName: widget.isTeach
          ? 'teachSkills'
          : 'learnSkills',
      skill: skill,
    );
  }
}