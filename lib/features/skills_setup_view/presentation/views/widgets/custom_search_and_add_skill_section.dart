
import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/core/widgets/custom_button.dart';

class CustomSearchAndAddSkillSection extends StatelessWidget {
  const CustomSearchAndAddSkillSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: TextField(
            decoration: AppDecoration.decorationForTextInputFeild(
              context: context,
              hintText: 'Search for skills ',
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomButton(
            child: Text(
              'Add Skill',
              style: AppStyles.medium18(context)
            ),
          ),
        ),
      ],
    );
  }
}
