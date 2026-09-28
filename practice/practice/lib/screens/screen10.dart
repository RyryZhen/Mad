import 'dart:math';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool isHorizontal = true; // To toggle layout

  List<Color> myColors = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ];

  List<Color> boxColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ]; // initial colors

  void changeLayout() {
    final random = Random();
    setState(() {
      // Toggle layout
      isHorizontal = !isHorizontal;

      // Generate new random colors for the 3 boxes
      boxColors = List.generate(
        3,
        (_) => myColors[random.nextInt(myColors.length)],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Stack Toggle'), centerTitle: true),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isHorizontal
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: boxColors
                          .map(
                            (color) => Container(
                              width: 80,
                              height: 80,
                              color: color,
                              margin: EdgeInsets.all(5),
                            ),
                          )
                          .toList(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: boxColors
                          .map(
                            (color) => Container(
                              width: 80,
                              height: 80,
                              color: color,
                              margin: EdgeInsets.all(5),
                            ),
                          )
                          .toList(),
                    ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: changeLayout,
                child: Text('Change Layout & Color'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
