import 'package:equatable/equatable.dart';

class PillsModel extends Equatable {
  final String name;
  final String imageUrl;
  final String category;
  final List<String> composite;
  final List<String> sideEffect;
  final String uses;
  const PillsModel(
      {required this.name,
      required this.composite,
      required this.imageUrl,
      required this.sideEffect,
      required this.uses,
      required this.category});

  @override
  List<Object?> get props => [name, imageUrl, category,composite, sideEffect, uses];
}
