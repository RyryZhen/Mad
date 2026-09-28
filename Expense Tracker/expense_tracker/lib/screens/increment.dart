// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Inc extends StatefulWidget {
  const Inc({super.key});

  @override
  State<Inc> createState() => _IncState();
}

class _IncState extends State<Inc> {
  final startCtrl = TextEditingController();
  final endCtrl = TextEditingController();
  final incCtrl = TextEditingController();

  double sum = 0;

  void calculate() {
    final start = double.tryParse(startCtrl.text) ?? 0;
    final end = double.tryParse(endCtrl.text) ?? 0;
    final inc = double.tryParse(incCtrl.text) ?? 1;

    double total = 0;
    double current = start;

    // Keep adding until it exceeds end
    while (current <= end) {
      total += current;
      current += inc;
    }

    setState(() {
      sum = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Increment Calculator')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Sum: $sum',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: startCtrl,
                decoration: const InputDecoration(
                  labelText: 'Start',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: endCtrl,
                decoration: const InputDecoration(
                  labelText: 'End',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: incCtrl,
                decoration: const InputDecoration(
                  labelText: 'Increment',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: calculate,
                child: const Text('Calculate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
