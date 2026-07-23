import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreServices {
  final instance = FirebaseFirestore.instance;

  Future<void> addUser({required String uid,required String fullName,required String userName,required String email}) async {
    await instance.collection('Users').doc(uid).set({
      'uid': uid,
      'fullName': fullName,
      'userName': userName,
      'email': email,
    });
  }
}
