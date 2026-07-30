import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/cubit/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_active_item.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/categories_inactive_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSkillsDataCubit, GetSkillsDataState>(
      builder: (context, state) {
        if (state is GetSkillsDataSuccess) {
          return SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.skills.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: const CategoriesActiveItem(text: 'All Topics'),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CategoriesInactiveItem(
                    categoriesModel: state.skills[index],
                  ),
                );
              },
            ),
          );
        } else if (state is GetSkillsDataFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
