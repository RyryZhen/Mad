import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final num1Ctrl = TextEditingController();
  final num2Ctrl = TextEditingController();
  final opCtrl = TextEditingController();

  List<String> history = []; // to store past results

  void compute() {
    final n1 = double.tryParse(num1Ctrl.text);
    final n2 = double.tryParse(num2Ctrl.text);
    final op = opCtrl.text.trim();

    if (n1 == null || n2 == null || op.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid inputs!')),
      );
      return;
    }

    double result;
    String operation;

    switch (op) {
      case '+':
        result = n1 + n2;
        operation = '$n1 + $n2 = $result';
        break;
      case '-':
        result = n1 - n2;
        operation = '$n1 - $n2 = $result';
        break;
      case '*':
        result = n1 * n2;
        operation = '$n1 × $n2 = $result';
        break;
      case '/':
        if (n2 == 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cannot divide by zero!')),
          );
          return;
        }
        result = n1 / n2;
        operation = '$n1 ÷ $n2 = ${result.toStringAsFixed(2)}';
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid operator! Use +, -, *, or /.')),
        );
        return;
    }

    setState(() {
      history.insert(0, operation); // add latest result at top
    });
  }

  void clearAll() {
    setState(() {
      num1Ctrl.clear();
      num2Ctrl.clear();
      opCtrl.clear();
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: num1Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter First Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: num2Ctrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Second Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: opCtrl,
              decoration: const InputDecoration(
                labelText: 'Enter Operation (+, -, *, /)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: compute,
                  child: const Text('Compute'),
                ),
                ElevatedButton(
                  onPressed: clearAll,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            //const Divider(),
            Expanded(
              child: ListView(
                children: history
                    .map((item) => ListTile(title: Text(item)))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
