import 'package:flutter/material.dart';
import 'package:practice_grid/bike.dart';
import 'package:practice_grid/bikeModel.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  List<Bike> mylist = [
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
    Bike(name: 'Phoenix', price: 15000.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemCount: mylist.length,
        itemBuilder: (BuildContext context, int index) {
          final bike = mylist[index];
          return Model(bike: bike);
        },
      ),
    );
  }
}
