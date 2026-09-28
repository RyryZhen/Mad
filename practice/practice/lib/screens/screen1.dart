import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scrollable Colors'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 150, color: Colors.red),
              Container(height: 150, color: Colors.orange),
              Container(height: 150, color: Colors.yellow),
              Container(height: 150, color: Colors.green),
              Container(height: 150, color: Colors.blue),
              Container(height: 150, color: Colors.indigo),
              Container(height: 150, color: Colors.purple),
              Container(height: 150, color: Colors.pink),
              Container(height: 150, color: Colors.teal),
              Container(height: 150, color: Colors.brown),
            ],
          ),
        ),
      ),
    );
  }
}
