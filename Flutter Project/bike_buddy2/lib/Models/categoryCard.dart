import 'package:flutter/material.dart';

//lib\Models\categoryCard.dart
class BikeCategory {
  final int id;
  final String type;
  final Color color;
  final String? iconPath;

  BikeCategory({
    required this.id,
    required this.type,
    required this.color,
    this.iconPath,
  });
}
