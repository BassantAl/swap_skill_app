import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class UsersLocalStorageServices {
  final Box<GetUserInfoModel> box;

  UsersLocalStorageServices({
    required this.box,
  });

  Future<void> saveUsers(
    List<GetUserInfoModel> users,
  ) async {
    await box.clear();

    for (final user in users) {
      await box.put(user.uid, user);
    }
  }

  List<GetUserInfoModel> getUsers() {
    return box.values.toList();
  }

  Future<void> clearUsers() async {
    await box.clear();
  }
}