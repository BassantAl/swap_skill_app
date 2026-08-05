import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_skills_data/get_skills_data_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/get_skills_success_view.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/shimmer_categories_list_view.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSkillsDataCubit, GetSkillsDataState>(
      builder: (context, state) {
        if (state is GetSkillsDataSuccess) {
          return GetSillsSuccessView(skills: state.skills);
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
