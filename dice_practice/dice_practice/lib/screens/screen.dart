import 'dart:math';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int diceNumber = 1; // Start at 1
  final random = Random();

  // Dice images (public URLs — can replace later with assets)
  final diceImages = [
    'https://upload.wikimedia.org/wikipedia/commons/1/1b/Dice-1-b.svg',
    'https://upload.wikimedia.org/wikipedia/commons/5/5f/Dice-2-b.svg',
    'https://upload.wikimedia.org/wikipedia/commons/b/b1/Dice-3-b.svg',
    'https://upload.wikimedia.org/wikipedia/commons/f/fd/Dice-4-b.svg',
    'https://upload.wikimedia.org/wikipedia/commons/0/08/Dice-5-b.svg',
    'https://upload.wikimedia.org/wikipedia/commons/2/26/Dice-6-b.svg',
  ];

  void rollDice() {
    setState(() {
      diceNumber = random.nextInt(6) + 1; // 1 to 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Roll a Dice'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                diceImages[diceNumber - 1],
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'You rolled a $diceNumber!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
