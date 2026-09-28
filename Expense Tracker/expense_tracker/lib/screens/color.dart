import 'dart:math';

import 'package:flutter/material.dart';

class RandomColorBox extends StatefulWidget {
  const RandomColorBox({super.key});

  @override
  State<RandomColorBox> createState() => _RandomColorBoxState();
}

class _RandomColorBoxState extends State<RandomColorBox> {
  // List of colors
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];

  Color currentColor = Colors.blue; // initial color

  void changeColor() {
    final random = Random();
    Color newColor;

    do {
      newColor = colors[random.nextInt(colors.length)];
    } while (newColor == currentColor); // avoid same color twice in a row

    setState(() {
      currentColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Color Changer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 200,
              height: 200,
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeColor,
              child: const Text('Change Color'),
            ),
          ],
        ),
      ),
    );
  }
}
