import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.text, this.onTap,});
  final String text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightPurple.withValues(alpha: 1),width: 0.25),
        borderRadius: BorderRadius.circular(32),
      
      ),
      child: Center(
        child: Row(
              mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                text.trim(),
                style: AppStyles.regular16(
                  context,
                ).copyWith(color: Colors.black),
              ),
            ),
            SizedBox(width: 6,),
            GestureDetector(
              onTap:onTap ,
              child: FaIcon(FontAwesomeIcons.xmark,size: 12,color: Colors.grey,)),
          ],
        ),
      ),
    );
  }
}
