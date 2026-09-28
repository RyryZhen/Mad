import 'package:flutter/material.dart';
import 'screens/screen.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';
import 'screens/screen4.dart';
import 'screens/screen5.dart';
import 'screens/screen6.dart';
import 'screens/screen7.dart';
import 'screens/screen8.dart';

void main() {
  runApp(const Practice());
}

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Screen());
  }
}
