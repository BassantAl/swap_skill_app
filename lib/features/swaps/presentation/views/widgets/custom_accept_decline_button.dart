import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/swaps/data/models/skill_request_with_sender_model.dart';
import 'package:swap_skill/features/swaps/presentation/manager/accept_request_cubit/accept_request_cubit_cubit.dart';
import 'package:swap_skill/features/swaps/presentation/manager/decline_request_cubit/decline_request_cubit.dart';

class CustomAcceptDeclineButton extends StatefulWidget {
  const CustomAcceptDeclineButton({
    super.key,
    required this.requests,
  });

  final SkillRequestWithSenderModel requests;

  @override
  State<CustomAcceptDeclineButton> createState() =>
      _CustomAcceptDeclineButtonState();
}

class _CustomAcceptDeclineButtonState
    extends State<CustomAcceptDeclineButton> {
  bool isHandled = false;

  @override
  Widget build(BuildContext context) {
    if (isHandled) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<AcceptRequestCubit>().acceptRequest(
                  senderId: widget.requests.sender.uid,
                  receiverId: widget.requests.request.receiverId,
                  requestId: widget.requests.request.id,
                );

                setState(() {
                  isHandled = true;
                });
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primaryPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Accept',
                  style: AppStyles.medium14(context).copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: GestureDetector(
              onTap: () {
                context.read<DeclineRequestCubit>().declineRequest(
                  requestId: widget.requests.request.id,
                );

                setState(() {
                  isHandled = true;
                });
              },
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffE3E1EC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Delete',
                  style: AppStyles.medium14(context).copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}