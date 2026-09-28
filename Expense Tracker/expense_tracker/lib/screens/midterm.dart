import 'package:flutter/material.dart';

class Midterm extends StatelessWidget {
  const Midterm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Start'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('End'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
