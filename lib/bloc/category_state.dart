

import 'package:pills/models/category_model.dart';

enum CategoryStatus {initial , loading, success , failure}

class CategoryState {
  final CategoryStatus status;
  final List<CategoryModel> categories;

  const CategoryState({this.status = CategoryStatus.initial , this.categories = const []});

  CategoryState copyWith({
  CategoryStatus? status,
  List<CategoryModel>? categories,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories
    );
  }
  
}