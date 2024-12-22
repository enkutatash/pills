import 'package:equatable/equatable.dart';

class PillsModel extends Equatable {
  final String name;
  final String imageUrl;
  final String category;
  final List<String> composition;
  final List<String> sideEffect;
  final String uses;
  final String duration;
  final String dose;
  final String frequency;
  const PillsModel(
      {required this.name,
      required this.composition,
      required this.imageUrl,
      required this.sideEffect,
      required this.uses,
      required this.category,
      required this.duration,
      required this.dose,
      required this.frequency});

  factory PillsModel.fromFirebase(Map<String, dynamic> json) {
    return PillsModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      composition: List<String>.from(json['composition']),
      sideEffect: List<String>.from(json['side_effect']),
      uses: json['use'],
      duration: json['duration'],
      dose: json['dose'],
      frequency: json['frequency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
      'composition': composition,
      'side_effect': sideEffect,
      'use': uses,
      'duration': duration,
      'dose': dose,
      'frequency': frequency,
    };
  }

  @override
  List<Object?> get props =>
      [name, imageUrl, category, composition, sideEffect, uses, duration, dose, frequency];
}
