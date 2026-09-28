import 'package:flutter/material.dart';

//lib\Models\pro_tips.dart
class ProTip {
  final int id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String category;
  bool isFavorite;

  ProTip({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.category,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconCode': icon.codePoint,
      'colorValue': color.value,
      'category': category,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory ProTip.fromMap(Map<String, dynamic> map) {
    return ProTip(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      icon: IconData(map['iconCode'], fontFamily: 'MaterialIcons'),
      color: Color(map['colorValue']),
      category: map['category'],
      isFavorite: map['isFavorite'] == 1,
    );
  }
}
