import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_with_sender_model.dart';
import 'package:swap_skill/features/swaps/presentation/manager/accept_request_cubit/accept_request_cubit_cubit.dart';
import 'package:swap_skill/features/swaps/presentation/manager/decline_request_cubit/decline_request_cubit.dart';

class CustomAcceptDeclineButton extends StatelessWidget {
  const CustomAcceptDeclineButton({super.key, required this.requests});
final SkillRequestWithSenderModel requests;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.primaryPurple,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              onPressed: () {
                context.read<AcceptRequestCubit>().acceptRequest(
                  requestId: requests.request.id,
                );
              },
              child: Text(
                'Accept',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xffE3E1EC)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              onPressed: () {
                 context.read<DeclineRequestCubit>().declineRequest(
                  requestId: requests.request.id,
                );
              },
              child: Text(
                'Decline',
                style: AppStyles.medium14(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
