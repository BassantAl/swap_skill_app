 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_learn_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/selected_skills_cubit/selected_teach_skills_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/buttom_sheet_body_for_setup.dart';

Future<dynamic> addSkillButtomSheet( {required BuildContext context , required bool isTeach}) {
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
          child: ButtomSheetBodyForSetup(isTeach: isTeach,),
        );
      },
    );
  }

 