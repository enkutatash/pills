import 'dart:convert';

import 'package:pills/models/category_model.dart';
import 'package:pills/models/pills_model.dart';
import 'package:pills/models/word_entity.dart';
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
    return (pillsJson ?? []).map((jsonStr) {
      final Map<String, dynamic> pillMap = json.decode(jsonStr);
      return PillsModel.fromFirebase(pillMap);
    }).toList();
  }

  Future<void> saveWords(List<WordEntity>words) async {
    List<String> wordz = words.map((word) => jsonEncode(word.toJson())).toList(); 
    await sharedPreferences.setStringList("words", wordz);  
  }

  List<WordEntity>getWords() {
    List<String>? savedWordz = sharedPreferences.getStringList("words");
    final result  =  (savedWordz ?? []).map((jsonStr) {
      final Map<String , dynamic> wordModel = jsonDecode(jsonStr);
      return WordEntity.fromJson(wordModel);
    }).toList();

    return result;
  }

  List<CategoryModel>getCategories() {
    List<String>? categories = sharedPreferences.getStringList("categories");
    final result = (categories ?? []).map((data) {
      final Map<String,dynamic> categoryModel = jsonDecode(data);
      return CategoryModel.fromJson(categoryModel);
    });

    return result.toList();
  }
  Future<void> saveCategories(List<CategoryModel>categories) async {
    List<String> categoriez = categories.map((data) => jsonEncode(data.toJson())).toList();
    await sharedPreferences.setStringList("caterories", categoriez);
  }
}
