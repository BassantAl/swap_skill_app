import 'package:swap_skill/core/services/firebase_firestore_services.dart';
import 'package:swap_skill/shared/get_all_users/data/repos/get_all_users_repo.dart';
import 'package:swap_skill/shared/user_info/data/model/get_user_info_model.dart';

class GetAllUsersRepoImpl implements GetAllUsersRepo {
  final FirebaseFirestoreServices firebaseFirestoreServices;
  GetAllUsersRepoImpl({required this.firebaseFirestoreServices});
  @override
  Future<List<GetUserInfoModel>> getAllUsers() async {
    final result = await firebaseFirestoreServices.getAllUsers();
    return result;
  }
}
