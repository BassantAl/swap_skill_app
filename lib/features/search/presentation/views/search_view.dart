import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/recommended_user_item.dart';
import 'package:swap_skill/shared/get_all_users/presentation/manager/cubit/get_all_users_cubit.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
      builder: (context, userState) {
        if (userState is GetUserInfoSuccess) {
          final currentUser = userState.getUserInfoModel;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) {
                    context
                        .read<GetAllUsersCubit>()
                        .searchForSkillOrPerson(value);
                  },
                  decoration:
                      AppDecoration.decorationForTextInputFeild(
                    context: context,
                    hintText: 'Search for a skill or person',
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
                  builder: (context, state) {
                    if (state is GetAllSearchResultlSuccess) {
                      final users = state.users;

                      if (users.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Text('No users found'),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: RecommendedUserItem(
                              getUserInfoModel: users[index],
                              currentUser: currentUser,
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}