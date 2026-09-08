import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:swap_skill/core/helper/add_skill_in_home.dart';
import 'package:swap_skill/core/helper/remove_skill.dart';

import 'package:swap_skill/features/home/presentation/views/widgets/add_skill_card.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/more_skill_card.dart';
import 'package:swap_skill/features/home/presentation/views/widgets/skill_card.dart';

import 'package:swap_skill/shared/user_info/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

class CustomSkillsList extends StatelessWidget {
  const CustomSkillsList({
    super.key,
    required this.items,
    required this.color,
    required this.isTeach,
  });

  final List<String> items;
  final Color color;
  final bool isTeach;

  @override
  Widget build(BuildContext context) {
    final visibleCount = min(items.length, 3);
    final remainingCount = items.length - visibleCount;

    return Wrap(
      spacing: 8,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        ...List.generate(visibleCount, (index) {
          final skill = items[index];

          return SkillCard(
            color: color,
            text: skill,
            onTap: () => _removeSkill(context, skill),
          );
        }),

        if (remainingCount > 0)
          MoreSkillCard(
            count: remainingCount,
            items: items,
            color: color,
            isTeach: isTeach,
          ),

        _AddSkillButton(isTeach: isTeach),
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
}

class _AddSkillButton extends StatelessWidget {
  const _AddSkillButton({required this.isTeach});

  final bool isTeach;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final newSkill = await addSkillInHome(
          context: context,
          isTeach: isTeach,
        );

        if (newSkill == null || !context.mounted) return;

        context.read<GetUserInfoCubit>().addSkillLocally(
          skill: newSkill,
          isTeachSkill: isTeach,
        );
      },
      child: const AddSkillCard(),
    );
  }
}
