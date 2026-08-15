import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/helper/add_skill_buttom_sheet.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';


class CustomSearchAndAddSkillSection extends StatelessWidget {
  const CustomSearchAndAddSkillSection({super.key, required this.isTeach});
  final bool isTeach;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            onChanged: (value) {
              context.read<GetSkillsDataCubit>().searchSkills(value);
            },
            decoration: AppDecoration.decorationForTextInputFeild(
              context: context,
              hintText: 'Search for skills ',
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: InkWell(
            onTap: () {
              addSkillButtomSheet(context: context ,isTeach: isTeach);
            },
            child: CustomButton(
              child: Text('Add Skill', style: AppStyles.medium18(context)),
            ),
          ),
        ),
      ],
    );
  }
  

}
