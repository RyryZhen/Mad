import 'package:flutter/material.dart';

class Math extends StatefulWidget {
  const Math({super.key});

  @override
  State<Math> createState() => _MathState();
}

class _MathState extends State<Math> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: num1ctrl,
                    decoration: InputDecoration(
                      label: Text("Enter First Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: num2ctrl,
                    decoration: InputDecoration(
                      label: Text("Enter Second Number"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: solve, child: Text("Compute")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("SUM: $sum")],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Average: $average")],
            ),
          ],
        ),
      ),
    );
  }

  var num1ctrl = TextEditingController();

  var num2ctrl = TextEditingController();

  double sum = 0;
  double average = 0;

  void solve() {
    double num1 = double.tryParse(num1ctrl.text) ?? 0;
    double num2 = double.tryParse(num2ctrl.text) ?? 0;

    setState(() {
      sum = num1 + num2;
      average = sum / 2;
    });
  }
}
