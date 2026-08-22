
import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key, this.onStartExchange, this.onMessage});

  final VoidCallback? onStartExchange;
  final VoidCallback? onMessage;

  @override
  Widget build(BuildContext context) {
    final startButton = ElevatedButton.icon(
      onPressed:
          onStartExchange ??
          () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Skill exchange is ready to start.')),
          ),
      icon: const Icon(Icons.swap_horiz),
      label: const Text('Start Skill Exchange'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(52),
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: AppStyles.medium16(context).copyWith(color: Colors.white),
      ),
    );
    final messageButton = OutlinedButton.icon(
      onPressed:
          onMessage ??
          () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Messaging is ready to use.')),
          ),
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
