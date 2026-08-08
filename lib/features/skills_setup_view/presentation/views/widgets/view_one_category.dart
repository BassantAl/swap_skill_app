import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_error_widget.dart';
import 'package:swap_skill/core/widgets/custom_loading_indicator.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/manager/get_category_cubit/get_category_cubit.dart';
import 'package:swap_skill/features/skills_setup_view/presentation/views/widgets/custom_skill_grid_view.dart';

class ViewOneCategory extends StatelessWidget {
  const ViewOneCategory({super.key, required this.isTeach});
final bool isTeach;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<GetCategoryCubit>().state;

    if (state is GetCategoryLoading) {
      return const CustomLoadingIndicator();
    }

    if (state is GetCategoryFailure) {
      return CustomErrorWidget(errorMessage: state.errorMessage);
    }

    if (state is GetCategorySuccess) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.categoriesModel.name,
              style: AppStyles.semiBold24(context),
            ),
            SizedBox(height: 20),
            Expanded(
              child: CustomSkillsGridView( 
                isTeach: isTeach,
                shrinkWrap: false,
                physics: AlwaysScrollableScrollPhysics(),
                skills: state.categoriesModel.skills.skills),
            ),
          ],
        ),
      );
    }

    return const SizedBox();
  }
}
