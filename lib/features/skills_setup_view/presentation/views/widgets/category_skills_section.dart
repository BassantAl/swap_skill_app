import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_skill_grid_view.dart';

class CategorySkillsSection extends StatelessWidget {
  const CategorySkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSkillsDataCubit, GetSkillsDataState>(
      builder: (context, state) {
        if (state is GetSkillsDataSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.38,
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemCount: state.skills.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.skills[index].name,
                            style: AppStyles.semiBold24(context),
                          ),
                          const SizedBox(height: 15),
                          CustomSkillsGridView(skills: state.skills[index].skills.skills,),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else if (state is GetSkillsDataLoading) {
          return CustomLoadingIndicator();
        } else if (state is GetSkillsDataFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
