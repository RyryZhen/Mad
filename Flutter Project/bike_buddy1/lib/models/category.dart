import 'package:flutter/material.dart';

class Category {
  late int id;
  late String name;
  late Color color;

  Category({required this.id, required this.name, this.color = Colors.orange});
}
//category.dart