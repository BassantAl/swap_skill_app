import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/helper/add_skill_in_home.dart';
import 'package:swap_skill/core/helper/remove_skill.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/add_skill_card.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/skill_card.dart';
import 'package:swap_skill/shared/user/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class CustomTeachSkillsSection extends StatelessWidget {
  const CustomTeachSkillsSection({super.key, required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills I Can Teach', style: AppStyles.semiBold20(context)),
        const SizedBox(height: 8),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  // onTap: () {
                  //   GoRouter.of(context).push(AppRoutes.skillDetailsView);
                  // },
                  child: SkillCard(onTap:() async {
                    await removeSkill(
                      skill: items[index],
                      context: context,
                      isTeach: true,
                    );
                    if (context.mounted) {
                      context
                          .read<GetUserInfoCubit>()
                          .removeSkillLocally(skill:  items[index],isTeachSkill: true);
                    }
                  },
                    text: items[index],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 14,),
         GestureDetector(
                onTap: () async {
                 final newSkill= await addSkillInHome(context: context, isTeach: true);
                   if (newSkill != null && context.mounted) {
                    context.read<GetUserInfoCubit>().addSkillLocally(
                      skill:  newSkill,
                      isTeachSkill: true
                    );
                  }
                 
                },
                child: AddSkillCard()
              ),
      ],
    );
  }
}
