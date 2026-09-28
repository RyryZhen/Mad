import 'package:flutter/material.dart';

//lib\Models\tip_highlight.dart
class DailyTip {
  final int id;
  final String title;
  final String description;

  DailyTip({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id + 9000,
      'title': title,
      'description': description,
      'iconCode': Icons.lightbulb_outline.codePoint,
      'colorValue': Colors.orange.value,
      'category': "Daily Tip",
    };
  }

  factory DailyTip.fromMap(Map<String, dynamic> map) {
    return DailyTip(
      id: (map['id'] as int) - 9000,
      title: map['title'],
      description: map['description'],
    );
  }
}
