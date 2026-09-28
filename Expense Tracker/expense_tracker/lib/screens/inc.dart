import 'package:flutter/material.dart';

class Increment extends StatefulWidget {
  const Increment({super.key});

  @override
  State<Increment> createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  var num = 0;

  void minus() {
    setState(() {
      num -= 3;
    });
  }

  void plus() {
    setState(() {
      num += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/wp1.jpg', fit: BoxFit.cover),
            Text('$num'),
            Row(
              children: [
                ElevatedButton(onPressed: minus, child: Text('-3')),
                ElevatedButton(onPressed: plus, child: Text('+5')),
              ],
            ),
            // ElevatedButton(onPressed: onPressed, child: Text('data'))
          ],
        ),
      ),
    );
  }
}
