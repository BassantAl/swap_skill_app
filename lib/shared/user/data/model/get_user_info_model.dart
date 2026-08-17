class GetUserInfoModel {
  final String email, fullName, userName, uid;
  final List<String> learnSkills;
  final List<String> teachSkills;

  GetUserInfoModel({
    required this.email,
    required this.fullName,
    required this.userName,
    required this.uid,
    required this.learnSkills,
    required this.teachSkills,
  });

  factory GetUserInfoModel.fromFirestore({Map<String, dynamic>? data}) {
    final safeData = data ?? <String, dynamic>{};

    return GetUserInfoModel(
      email: safeData['email'] as String? ?? '',
      fullName: safeData['fullName'] as String? ?? '',
      userName: safeData['userName'] as String? ?? '',
      uid: safeData['uid'] as String? ?? '',
      learnSkills: (safeData['learnSkills'] as List<dynamic>? ?? const [])
          .map((skill) => skill.toString())
          .toList(),
      teachSkills: (safeData['teachSkills'] as List<dynamic>? ?? const [])
          .map((skill) => skill.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fullName': fullName,
      'userName': userName,
      'uid': uid,
      'learnSkills': learnSkills,
      'teachSkills': teachSkills,
    };
  }

  GetUserInfoModel copyWith({
    String? email,
    String? fullName,
    String? userName,
    String? uid,
    List<String>? learnSkills,
    List<String>? teachSkills,
  }) {
    return GetUserInfoModel(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      uid: uid ?? this.uid,
      learnSkills: learnSkills ?? this.learnSkills,
      teachSkills: teachSkills ?? this.teachSkills,
    );
  }
}
