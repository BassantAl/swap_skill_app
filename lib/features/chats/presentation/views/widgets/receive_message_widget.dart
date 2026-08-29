import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/chats/data/models/chat_model.dart';

class ReceiveMessageWidget extends StatelessWidget {
  const ReceiveMessageWidget({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8, right: 48),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          color: AppColors.neutral,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child:Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          runSpacing: 4,
          spacing: 12, 
          children: [
            Text(
              messageModel.message,
              style: AppStyles.medium16(context).copyWith(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    messageModel.createdAt != null
                        ? "${messageModel.createdAt!.hour}:${messageModel.createdAt!.minute.toString().padLeft(2, '0')}"
                        : "",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withAlpha(180),
                    ),
                  ),
                  const SizedBox(width: 4),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



