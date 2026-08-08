import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_back_button.dart';
import 'package:swap_skill/features/onboarding/presentation/views/widgets/custom_next_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_buttom_sheet_form.dart';

class ButtomSheetBody extends StatefulWidget {
  const ButtomSheetBody({super.key, required this.isTeach});
  final bool isTeach;

  @override
  State<ButtomSheetBody> createState() => _ButtomSheetBodyState();
}

class _ButtomSheetBodyState extends State<ButtomSheetBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  String skill = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Skill', style: AppStyles.semiBold24(context)),
            const SizedBox(height: 20),
            CustomButtomSheetForm(
              formKey: formKey,
              onSavedSkill: (value) {
                skill = value!.trim();
              },
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: CustomBackButton(text: 'close'),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      addSkill(context);
                    },
                    child: CustomNextButton(text: 'Add Skill'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
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
