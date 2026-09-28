import 'package:flutter/material.dart';

//lib\Models\repair_selection.dart
class Repairs {
  late int id;
  late String title;
  String? avatarPath;
  String? description;
  Color color;

  Repairs({
    required this.id,
    required this.title,
    this.avatarPath,
    this.description,
    this.color = Colors.blue,
  });
}
