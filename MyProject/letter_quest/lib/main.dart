import 'package:flutter/material.dart';
import 'package:letter_quest/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}
