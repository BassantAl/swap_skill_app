import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swap_skill/features/home/presentation/manager/remove_skill_cubit/remove_skill_cubit.dart';

Future<void> removeSkill({ required String skill, required  BuildContext context, required bool isTeach}) async{
  if(isTeach){
    await context.read<RemoveSkillCubit>().removeSkill(skill: skill, fieldName: 'teachSkills');
  }else{
     await context.read<RemoveSkillCubit>().removeSkill(skill: skill, fieldName: 'learnSkills');
  }
}

 