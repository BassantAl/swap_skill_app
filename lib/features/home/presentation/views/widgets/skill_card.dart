import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.text, this.onTap, required this.color});

  final String text;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      decoration: ShapeDecoration(
        color: color.withAlpha(25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text.trim(),
            style: AppStyles.medium16(context).copyWith(color: Colors.black.withAlpha(200)),
          ),
          const SizedBox(width: 6),
          GestureDetector(
            onTap: onTap,
            child:  FaIcon(
              FontAwesomeIcons.xmark,
              size: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
