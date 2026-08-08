import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';

class CustomButtomSheetForm extends StatelessWidget {
  const CustomButtomSheetForm({super.key, required this.formKey, this.onSavedSkill, this.onSavedCategory});
  final GlobalKey<FormState> formKey;
  final void Function(String?)? onSavedSkill;
  final void Function(String?)? onSavedCategory;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skill Name', style: AppStyles.medium16(context)),
          const SizedBox(height: 5),
          TextFormField(
            onSaved: onSavedSkill,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'please write skill name';
              }
              return null;
            },
            decoration: AppDecoration.decorationForTextInputFeild(
              context: context,
              hintText: 'e.g. FlutterFlow',
            ),
          ),
          const SizedBox(height: 32),

          BlocBuilder<GetSkillsDataCubit, GetSkillsDataState>(
            builder: (context, state) {
              if (state is GetSkillsDataSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category', style: AppStyles.medium16(context)),
                    const SizedBox(height: 5),
                    DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please write skill name';
                        }
                        return null;
                      },
                      dropdownColor: AppColors.backgroundColor,
                      decoration: AppDecoration.decorationForTextInputFeild(
                        context: context,
                        hintText: 'Select a category',
                      ),
                      items: state.skills
                          .map(
                            (e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        log(value!);
                      },
                      onSaved:onSavedCategory,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
