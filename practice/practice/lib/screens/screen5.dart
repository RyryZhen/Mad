import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  int r = 128, g = 128, b = 128;

  void rotateChannels() {
    setState(() {
      int temp = r;
      r = g;
      g = b;
      b = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Mixing')),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: Color.fromARGB(255, r, g, b),
              margin: EdgeInsets.all(16),
            ),
            Slider(
              value: r.toDouble(),
              min: 0,
              max: 255,
              activeColor: Colors.red,
              onChanged: (v) => setState(() => r = v.toInt()),
            ),
            Slider(
              value: g.toDouble(),
              min: 0,
              max: 255,
              activeColor: Colors.green,
              onChanged: (v) => setState(() => g = v.toInt()),
            ),
            Slider(
              value: b.toDouble(),
              min: 0,
              max: 255,
              activeColor: Colors.blue,
              onChanged: (v) => setState(() => b = v.toInt()),
            ),
            ElevatedButton(
              onPressed: rotateChannels,
              child: Text('Rotate Channels'),
            ),
          ],
        ),
      ),
    );
  }
}
