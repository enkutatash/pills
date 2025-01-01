
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable{
  final String name;

  const CategoryModel({required this.name});
  
  factory CategoryModel.fromJson(Map<String , dynamic> jsonData) {
    return CategoryModel(name: jsonData['name']);
  }

  Map<String , dynamic>toJson() {
    return {'name' : name};
  }

  @override
  List<Object?> get props => [];
}