import 'package:flutter/material.dart';
import 'dart:math';

class Screen7 extends StatefulWidget {
  const Screen7({super.key});

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  TextEditingController controller = TextEditingController();
  String scrambled = '';
  List<String> history = [];

  void shuffleString() {
    if (controller.text.isEmpty) return;
    List<String> chars = controller.text.split('');
    chars.shuffle(Random());
    setState(() {
      scrambled = chars.join();
      history.add(scrambled);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('String Puzzle')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Enter a word'),
              ),
            ),
            ElevatedButton(onPressed: shuffleString, child: Text('Shuffle')),
            SizedBox(height: 20),
            Text('Scrambled: $scrambled', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: history.map((s) => ListTile(title: Text(s))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
