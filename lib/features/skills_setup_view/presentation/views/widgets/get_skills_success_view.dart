import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/skills_setup_view/data/models/categories_model.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_all_topics_card.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/manage_categories_state.dart';

class GetSillsSuccessView extends StatefulWidget {
  const GetSillsSuccessView({super.key, required this.skills});
  final List<CategoriesModel> skills;

  @override
  State<GetSillsSuccessView> createState() => _GetSillsSuccessViewState();
}

class _GetSillsSuccessViewState extends State<GetSillsSuccessView> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.skills.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ManageAllTopicsCard(
              isActive: selectedCategoryIndex == 0,
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
                context.read<GetCategoryCubit>().resetCategory();
                context.read<GetSkillsDataCubit>().getSkillsData();
              },
            );
          }
          return ManageCategoriesStates(
            name: widget.skills[index - 1].name,
            isActive: selectedCategoryIndex == index,
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
              context.read<GetCategoryCubit>().getCategory(
                id: widget.skills[index - 1].name,
              );
            },
            selectedCategoryIndex: selectedCategoryIndex,
          );
        },
      ),
    );
  }
}
