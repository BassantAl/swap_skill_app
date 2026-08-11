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
}
