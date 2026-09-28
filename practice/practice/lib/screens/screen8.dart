import 'package:flutter/material.dart';
import 'dart:math';

class Screen8 extends StatefulWidget {
  const Screen8({super.key});

  @override
  State<Screen8> createState() => _Screen8State();
}

class _Screen8State extends State<Screen8> {
  int dice = 1;
  Random random = Random();

  void rollDice() {
    setState(() {
      int roll = random.nextInt(100); // 0-99
      if (roll < 50) {
        dice = 6; // 50% chance
      } else {
        dice = random.nextInt(5) + 1; // 1-5 share 50%
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weighted Dice')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dice: $dice', style: TextStyle(fontSize: 48)),
            SizedBox(height: 40),
            ElevatedButton(onPressed: rollDice, child: Text('Roll Dice')),
          ],
        ),
      ),
    );
  }
}
