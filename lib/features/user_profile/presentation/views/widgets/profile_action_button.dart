import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/user_profile/presentation/manager/cubit/send_request_cubit.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({
    super.key,
    required this.user,
    required this.currentUser,
  });

  final GetUserInfoModel user;
  final GetUserInfoModel currentUser;

  @override
  Widget build(BuildContext context) {
    final startButton = ElevatedButton.icon(
      onPressed: () async{
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
    final messageButton = OutlinedButton.icon(
      onPressed: () {},
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

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 460) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [startButton, const SizedBox(height: 10), messageButton],
          );
        }
        return Row(
          children: [
            Expanded(flex: 3, child: startButton),
            const SizedBox(width: 10),
            Expanded(flex: 2, child: messageButton),
          ],
        );
      },
    );
  }
}
