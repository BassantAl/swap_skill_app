import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: ShapeDecoration(
       
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: AppColors.neutral,
        width: 0.45,
        strokeAlign: BorderSide.strokeAlignInside, 
      ),
    ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text.trim(),
            style: AppStyles.regular16(context).copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onTap,
            child: const FaIcon(
              FontAwesomeIcons.xmark,
              size: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}