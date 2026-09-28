import 'package:flutter/material.dart';

class SecondSc extends StatelessWidget {
  const SecondSc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Text('HELLO'),
    );
  }
}
