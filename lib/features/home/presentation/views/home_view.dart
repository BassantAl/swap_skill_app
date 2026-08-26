import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

import 'package:swap_skill/features/home/presentation/manager/add_new_skill/add_new_skill_cubit.dart';
import 'package:swap_skill/features/home/presentation/manager/get_recommend_users_cubit/get_recommended_users_cubit.dart';
import 'package:swap_skill/features/home/presentation/manager/remove_skill_cubit/remove_skill_cubit.dart';

import 'package:swap_skill/features/home/presentation/views/widgets/custom_user_skill_section.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/recommend_for_you_section.dart';
import 'package:swap_skill/shared/get_all_friends/presentation/manager/cubit/get_all_freiends_cubit.dart';

import 'package:swap_skill/shared/get_all_users/presentation/manager/cubit/get_all_users_cubit.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  void _getRecommendations(BuildContext context) {
    final userState = context.read<GetUserInfoCubit>().state;

    final usersState = context.read<GetAllUsersCubit>().state;
    final friendsState = context.read<GetAllFreiendsCubit>().state;

    if (userState is GetUserInfoSuccess &&
        usersState is GetAllUserslSuccess &&
        friendsState is GetAllFreiendsSuccess) {
      context.read<GetRecommendedUsersCubit>().getRecommendedUsers(
        currentUser: userState.getUserInfoModel,
        users: usersState.users,
        friendships: friendsState.friends,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNewSkillCubit()),
        BlocProvider(create: (context) => RemoveSkillCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetUserInfoCubit, GetUserInfoState>(
            listener: (context, state) {
              _getRecommendations(context);
            },
          ),

          BlocListener<GetAllUsersCubit, GetAllUsersState>(
            listener: (context, state) {
              _getRecommendations(context);
            },
          ),

          BlocListener<GetAllFreiendsCubit, GetAllFreiendsState>(
            listener: (context, state) {
              _getRecommendations(context);
            },
          ),

          BlocListener<AddNewSkillCubit, AddNewSkillState>(
            listener: (context, state) {
              if (state is AddNewSkillFailure) {
                context.read<GetUserInfoCubit>().restorePreviousUser();
              }
            },
          ),

          BlocListener<RemoveSkillCubit, RemoveSkillState>(
            listener: (context, state) {
              if (state is RemoveSkillFailure) {
                context.read<GetUserInfoCubit>().restorePreviousUser();
              }
            },
          ),
        ],
        child: SingleChildScrollView(
          child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
            builder: (context, state) {
              if (state is GetUserInfoSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [AppColors.lightPurple, AppColors.secondary],
                        ).createShader(bounds);
                      },
                      child: Text(
                        'Hello, ${state.getUserInfoModel.fullName[0].toUpperCase()}${state.getUserInfoModel.fullName.substring(1)}',
                        style: AppStyles.semiBold24(
                          context,
                        ).copyWith(color: Colors.white),
                      ),
                    ),

                    Text(
                      'What do you want to learn today?',
                      style: AppStyles.regular16(context),
                    ),

                    const SizedBox(height: 20),

                    CustomUserSkillsSection(
                      getUserInfoModel: state.getUserInfoModel,
                    ),

                    const SizedBox(height: 30),

                    RecommendForYouSection(currentUser: state.getUserInfoModel),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
