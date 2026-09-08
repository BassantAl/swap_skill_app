import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/core/helper/add_skill_in_home.dart';
import 'package:swap_skill/core/helper/remove_skill.dart';
import 'package:swap_skill/core/theme/app_styles.dart';
import 'package:swap_skill/features/home/presentation/manager/add_new_skill/add_new_skill_cubit.dart';
import 'package:swap_skill/features/home/presentation/manager/remove_skill_cubit/remove_skill_cubit.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/skill_card.dart';
import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class MoreSkillCard extends StatelessWidget {
  const MoreSkillCard({super.key, 
    required this.count,
    required this.items,
    required this.color,
    required this.isTeach,
  });

  final int count;
  final List<String> items;
  final Color color;
  final bool isTeach;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<RemoveSkillCubit>()),

                BlocProvider.value(value: context.read<AddNewSkillCubit>()),

                BlocProvider.value(value: context.read<GetUserInfoCubit>()),
              ],
              child: _AllSkillsDialog(color: color, isTeach: isTeach),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             Icon(Icons.unfold_more, size: 16, color: Colors.black.withAlpha(200)),

            const SizedBox(width: 4),

            Text(
              '+$count more',
              style:  AppStyles.medium16(context).copyWith(color: Colors.black.withAlpha(200)),
            ),
          ],
        ),
      ),
    );
  }
}


class _AllSkillsDialog extends StatelessWidget {
  const _AllSkillsDialog({required this.color, required this.isTeach});

  final Color color;
  final bool isTeach;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,

      title: Text(isTeach ? 'Skills I Can Teach' : 'Skills I Want to Learn'),

     content: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
  builder: (context, state) {
    if (state is GetUserInfoSuccess) {
      final user = state.getUserInfoModel;

      final skills = isTeach
          ? user.teachSkills
          : user.learnSkills;

      return SizedBox(
        width: 500,
        child: Wrap(
          spacing: 8,
          runSpacing: 10,
          children: skills.map(
            (skill) {
              return SkillCard(
                color: color,
                text: skill,
                onTap: () => _removeSkill(
                  context,
                  skill,
                ),
              );
            },
          ).toList(),
        ),
      );
    }

    return const SizedBox.shrink();
  },
),

      actions: [
        TextButton(
          onPressed: () => _addSkill(context),
          child: Text(
            'Add Skill',
            style: AppStyles.medium16(context),
          ),
        ),

        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Done',style:  AppStyles.medium16(context)),
        ),
      ],
    );
  }

  Future<void> _removeSkill(BuildContext context, String skill) async {
    await removeSkill(skill: skill, context: context, isTeach: isTeach);

    if (!context.mounted) return;

    context.read<GetUserInfoCubit>().removeSkillLocally(
      skill: skill,
      isTeachSkill: isTeach,
    );
  }

  Future<void> _addSkill(BuildContext context) async {
    final newSkill = await addSkillInHome(context: context, isTeach: isTeach);

    if (newSkill == null || !context.mounted) return;

    context.read<GetUserInfoCubit>().addSkillLocally(
      skill: newSkill,
      isTeachSkill: isTeach,
    );
  }
}
