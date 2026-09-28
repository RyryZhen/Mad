import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  double boxsize = 100;

  void grow() {
    setState(() {
      if (boxsize < 500) {
        boxsize += 20;
      }
    });
  }

  void shrink() {
    setState(() {
      if (boxsize > 100) {
        boxsize -= 20;
      }
    });
  }

  bool trueColor = true;

  void changeColor(){
    setState(() {
      trueColor = !trueColor; 
    });
  }

  List<Color> myColors = [
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.green,
  ];
var generated = 0;
  void change() {
    var random = Random();
    setState(() {
      generated = random.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is John Cena'), centerTitle: true),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 100, width: 100, color: Colors.black),
                Container(height: 100, width: 100, color: Colors.red),
              ],
            ),

            Column(
              children: [
                Container(height: boxsize, width: boxsize, color: myColors[2]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: grow, child: Text('Click +')),
                    SizedBox(width: 20),
                    ElevatedButton(onPressed: shrink, child: Text('Click -')),
                  ],
                ),
                ElevatedButton(onPressed: change, child: Text('Change Color')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 100, width: 100, color: Colors.blue),

                Container(height: 100, width: 100, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
