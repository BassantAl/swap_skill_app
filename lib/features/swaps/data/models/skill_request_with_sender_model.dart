import 'package:swap_skill/features/swaps/data/models/skill_request_model.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class SkillRequestWithSenderModel {
  final SkillRequestModel request;
  final GetUserInfoModel sender;

  SkillRequestWithSenderModel({
    required this.request,
    required this.sender,
  });
}