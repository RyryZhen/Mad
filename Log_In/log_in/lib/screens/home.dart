import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key, required this.username, required this.password});
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), backgroundColor: Colors.blue),
      body: SafeArea(
        child: Column(
          children: [Text('Username: $username\nPassword: $password ')],
        ),
      ),
    );
  }
}
