import 'package:flutter/material.dart';
import 'package:practice_grid/bike.dart';

class Model extends StatelessWidget {
  Model({super.key, required this.bike});

  Bike bike;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
      ),
      child: Text(bike.name),
    );
  }
}
