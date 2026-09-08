import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/shared/get_all_users/presentation/manager/cubit/get_all_users_cubit.dart';

class CustomsearchForSkillOrPerson extends StatelessWidget {
  const CustomsearchForSkillOrPerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        onChanged: (value) {
          context
              .read<GetAllUsersCubit>()
              .searchForSkillOrPerson(value);
        },
        decoration: AppDecoration.decorationForTextInputFeild(
          context: context,
          hintText: 'Search for a skill or person',
          prefixIcon: const Icon(Icons.search, size: 20),
        ),
      ),
    );
  }
}