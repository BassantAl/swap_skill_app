import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_all_topics_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_categories_state.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/shimmer_categories_list_view.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSkillsDataCubit, GetSkillsDataState>(
      builder: (context, state) {
        if (state is GetSkillsDataSuccess) {
          return SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.skills.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ManageAllTopicsCard(
                    isActive: selectedCategoryIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                  );
                }
                return ManageCategoriesStates(
                  name: state.skills[index - 1].name,
                  isActive: selectedCategoryIndex == index,
                  onTap: () {
                    context.read<GetSkillsDataCubit>().getSkillsData();
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  selectedCategoryIndex: selectedCategoryIndex,
                );
              },
            ),
          );
        } else if (state is GetSkillsDataFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox(
            height: 48,
            child: ShimmerCategoriesListView(itemCount: 8),
          );
        }
      },
    );
  }
}
