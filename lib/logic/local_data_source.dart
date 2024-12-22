// import 'dart:convert';

// import 'package:pills/models/pills_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalDataSource {
//   final SharedPreferences sharedPreferences;

//  LocalDataSource({SharedPreferences? shared})
//       : sharedPreferences = shared ?? SharedPreferences.getInstance() as SharedPreferences;

//    Future<void> saveCategory(String category, List<PillsModel> pills) async {
//     List<String> pillsJson = pills.map((pill) => json.encode(pill.toJson())).toList();
//     await sharedPreferences.setStringList(category, pillsJson);
//   }

//   List<PillsModel> getCategory(String category) {
//     List<String>? pillsJson = sharedPreferences.getStringList(category);
//     if (pillsJson == null) {
//       return [];
//     }
//     return pillsJson.map((jsonStr) {
//       final Map<String, dynamic> pillMap = json.decode(jsonStr);
//       return PillsModel.fromFirebase(pillMap);
//     }).toList();
//   }
// }