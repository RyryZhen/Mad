import 'package:flutter/material.dart';
import 'package:student_practice/list.dart';

class Addscreen extends StatelessWidget {
  Addscreen({super.key, required this.add});

  Function add;

  var fname = TextEditingController();
  var lname = TextEditingController();
  var age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: fname,
                decoration: InputDecoration(
                  label: Text("First Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: lname,
                decoration: InputDecoration(
                  label: Text("Last Name"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: age,
                decoration: InputDecoration(
                  label: Text("Age"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  add(
                    LIST(fname: fname.text, lname: lname.text, age: age.text),
                  );
                  Navigator.pop(context);
                },
                child: Text("ADD"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
