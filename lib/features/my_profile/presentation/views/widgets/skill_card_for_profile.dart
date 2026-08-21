import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SkillCardForProfile extends StatelessWidget {
  const SkillCardForProfile({super.key, required this.color, required this.text});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: color
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(text,style: AppStyles.medium16(context),)),
    );
  }
}
