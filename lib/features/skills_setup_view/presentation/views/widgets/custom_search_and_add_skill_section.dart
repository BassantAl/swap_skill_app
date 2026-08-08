import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/buttom_sheet_body.dart';

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
              addSkillButtomSheet(context);
            },
            child: CustomButton(
              child: Text('Add Skill', style: AppStyles.medium18(context)),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> addSkillButtomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modalContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<GetSkillsDataCubit>()),
            if (isTeach)
              BlocProvider.value(
                value: context.read<SelectedTeachSkillsCubit>(),
              )
            else
              BlocProvider.value(
                value: context.read<SelectedLearnSkillsCubit>(),
              ),
          ],
          child: ButtomSheetBody(isTeach: isTeach,),
        );
      },
    );
  }
}
