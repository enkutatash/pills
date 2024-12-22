import 'dart:convert';

import 'package:pills/models/pills_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSource._({required this.sharedPreferences});

  static Future<LocalDataSource> create() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return LocalDataSource._(sharedPreferences: sharedPreferences);
  }

  Future<void> saveCategory(String category, List<PillsModel> pills) async {
    List<String> pillsJson = pills.map((pill) => json.encode(pill.toJson())).toList();
    await sharedPreferences.setStringList(category, pillsJson);
  }

  List<PillsModel> getCategory(String category) {
    List<String>? pillsJson = sharedPreferences.getStringList(category);
    if (pillsJson == null) {
      return [];
    }
    return pillsJson.map((jsonStr) {
      final Map<String, dynamic> pillMap = json.decode(jsonStr);
      return PillsModel.fromFirebase(pillMap);
    }).toList();
  }
}
