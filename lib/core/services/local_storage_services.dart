import 'dart:ui';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class LocalStorageServices {
  final Box box;
  LocalStorageServices({required this.box});

  Future<void> saveData({required String key, dynamic value}) async {
    await box.put(key, value);
  }

  dynamic getData({required String key}) {
    final data = box.get(key);

    if (data == null) {
      return null;
    }
    return data;
  }

  Future<void> clearUser({required String key}) async {
    await box.delete(keepToString);
  }

  bool containsKey({required String key}) {
    return box.containsKey(key);
  }
}
