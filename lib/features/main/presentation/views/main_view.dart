import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/di/service_locator.dart';
import 'package:swap_skill/core/widgets/adaptive_layout_widget.dart';
import 'package:swap_skill/features/main/presentation/views/widgets/main_mobile_layout.dart';
import 'package:swap_skill/shared/recommend_for_you/data/repos/recomendation_repo.dart';
import 'package:swap_skill/shared/recommend_for_you/presentation/manager/cubit/get_recommended_users_cubit.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = GetRecommendedUsersCubit(
          getIt<RecommendationsRepo>(),
        );

        final state = context.read<GetUserInfoCubit>().state;

        if (state is GetUserInfoSuccess) {
          cubit.getRecommendedUsers(
            state.getUserInfoModel,
          );
        }

        return cubit;
      },
      child: BlocListener<GetUserInfoCubit, GetUserInfoState>(
        listener: (context, state) {
          if (state is GetUserInfoSuccess) {
            context
                .read<GetRecommendedUsersCubit>()
                .getRecommendedUsers(
                  state.getUserInfoModel,
                );
          }
        },
        child: AdaptiveLayoutWidget(
          mobileLayout: (context) {
            return MainMobileLayout(
              child: child,
            );
          },
          tabletLayout: (context) {
            return const SizedBox();
          },
          desktopLayout: (context) {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}