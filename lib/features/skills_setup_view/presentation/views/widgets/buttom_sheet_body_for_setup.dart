import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/widgets/buttom_sheet_body.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';

class ButtomSheetBodyForSetup extends StatefulWidget {
  const ButtomSheetBodyForSetup({super.key, required this.isTeach, this.onTap});
  final bool isTeach;
  final void Function()? onTap;

  @override
  State<ButtomSheetBodyForSetup> createState() =>
      _ButtomSheetBodyForSetupState();
}

class _ButtomSheetBodyForSetupState extends State<ButtomSheetBodyForSetup> {
  GlobalKey<FormState> formKey = GlobalKey();
  String skill = '';

  @override
  Widget build(BuildContext context) {
    return ButtomSheetBody(
      formKey: formKey,
      onSavedSkill: (value) {
        skill = value!;
      },
      onTap: () {
        addSkill(context);
      },
    );
  }

  void addSkill(BuildContext context) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    formKey.currentState!.save();

    if (widget.isTeach) {
      context.read<SelectedTeachSkillsCubit>().toggleSkill(skill: skill);
    } else {
      context.read<SelectedLearnSkillsCubit>().toggleSkill(skill: skill);
    }

    GoRouter.of(context).pop();
  }
}
