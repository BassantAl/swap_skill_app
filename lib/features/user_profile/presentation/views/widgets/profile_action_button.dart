import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swap_skill/core/routes/app_routes.dart';

import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

import 'package:swap_skill/features/user_profile/presentation/manager/cubit/send_request_cubit.dart';

import 'package:swap_skill/shared/get_all_friends/data/models/friend_model.dart';
import 'package:swap_skill/shared/get_all_friends/presentation/manager/cubit/get_all_freiends_cubit.dart';

import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({
    super.key,
    required this.user,
    required this.currentUser,
  });

  final GetUserInfoModel user;
  final GetUserInfoModel currentUser;

  bool _isFriend({required List<FriendModel> friendships}) {
    return friendships.any(
      (friendship) =>
          (friendship.user1Id == currentUser.uid &&
              friendship.user2Id == user.uid) ||
          (friendship.user2Id == currentUser.uid &&
              friendship.user1Id == user.uid),
    );
  }

  @override
  Widget build(BuildContext context) {
    final friendsState = context.watch<GetAllFreiendsCubit>().state;

    final isCurrentUser = user.uid == currentUser.uid;

    bool isFriend = false;

    if (friendsState is GetAllFreiendsSuccess) {
      isFriend = _isFriend(friendships: friendsState.friends);
    }

    final messageButton = OutlinedButton.icon(
      onPressed: () {
        GoRouter.of(context).push(AppRoutes.chatView , extra: user) ;
      },
      icon: const Icon(Icons.chat_bubble_outline),
      label: const Text('Message'),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        foregroundColor: AppColors.primaryPurple,
        side: const BorderSide(color: AppColors.primaryPurple),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: AppStyles.medium16(
          context,
        ).copyWith(color: AppColors.primaryPurple),
      ),
    );

    final sendRequestButton = ElevatedButton.icon(
      onPressed: () async {
        await context.read<SendRequestCubit>().sendRequest(
          senderId: currentUser.uid,
          receiverId: user.uid,
        );
      },
      icon: const Icon(Icons.swap_horiz),
      label: const Text('Send Request'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: AppStyles.medium16(context).copyWith(color: Colors.white),
      ),
    );

    // Current user profile
    if (isCurrentUser) {
      return SizedBox(width: double.infinity, child: messageButton);
    }

    // Already friends
    if (isFriend) {
      return SizedBox(width: double.infinity, child: messageButton);
    }

    // Not current user and not friend
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [sendRequestButton, const SizedBox(height: 10), messageButton],
    );
  }
}
