import 'package:flutter/material.dart';
import 'package:practice_grid/practice1/item.dart';

class Display1 extends StatelessWidget {
  Display1({super.key, required this.item});

  Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: item.color,
      ),
      child: Text(item.name),
    );
  }
}
