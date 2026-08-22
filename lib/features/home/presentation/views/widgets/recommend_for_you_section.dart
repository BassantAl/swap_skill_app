import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/home/presentation/manager/get_recommend_users_cubit/get_recommended_users_cubit.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/recommended_user_item.dart';

class RecommendForYouSection extends StatelessWidget {
  const RecommendForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecommendedUsersCubit, GetRecommendedUsersState>(
      builder: (context, state) {
        if (state is GetRecommendedUsersSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('Recommended for You', style: AppStyles.semiBold24(context)),
              const SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom:  24,left: 8,right: 8),
                    child: RecommendedUserItem(
                      getUserInfoModel: state.users[index],
                    ),
                  );
                },
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
