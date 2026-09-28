import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  int index = 0;
  List<int> fibSequence = [0, 1];
  double boxSize = 100;

  void nextFib() {
    setState(() {
      if (index < fibSequence.length - 1) {
        index++;
      } else {
        int next = fibSequence[index] + fibSequence[index - 1];
        fibSequence.add(next);
        index++;
      }
      boxSize = 50 + fibSequence[index] * 0.5;
      if (boxSize > 300) boxSize = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rotating Fibonacci Number')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: boxSize,
              width: boxSize,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text(
                fibSequence[index].toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(onPressed: nextFib, child: Text('Next Fibonacci')),
          ],
        ),
      ),
    );
  }
}
