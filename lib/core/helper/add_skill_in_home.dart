import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/home/presentation/manager/add_new_skill/add_new_skill_cubit.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/buttom_sheet_body_for_home.dart';

Future<String?> addSkillInHome({
  required BuildContext context,
  required bool isTeach,
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    builder: (modalContext) {
      return BlocProvider.value(
        value: context.read<AddNewSkillCubit>(),
        child: ButtomSheetBodyForHome(
          isTeach: isTeach,
        ),
      );
    },
  );
}