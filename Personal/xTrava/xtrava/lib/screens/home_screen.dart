import 'package:flutter/material.dart';

import 'tracking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Strava')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start Activity'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TrackingScreen()),
            );
          },
        ),
      ),
    );
  }
}
