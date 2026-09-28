import 'package:flutter/material.dart';

import 'onboarding.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 150),
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: start,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text('Start', style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void start() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => OnboardingOne()));
  }
}
