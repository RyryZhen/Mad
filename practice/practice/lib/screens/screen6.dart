import 'package:flutter/material.dart';
import 'dart:math';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  List<double> heights = List.generate(
    5,
    (_) => Random().nextDouble() * 150 + 50,
  );

  void bubbleSortStep() {
    setState(() {
      for (int i = 0; i < heights.length - 1; i++) {
        if (heights[i] > heights[i + 1]) {
          double temp = heights[i];
          heights[i] = heights[i + 1];
          heights[i + 1] = temp;
        }
      }
    });
  }

  void shuffleHeights() {
    setState(() {
      heights.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorting Game')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: heights
                  .map(
                    (h) => AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: h,
                      width: 50,
                      color: Colors.blue,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: bubbleSortStep,
                  child: Text('Sort Step'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: shuffleHeights,
                  child: Text('Shuffle'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
