import 'package:flutter/material.dart';
import 'package:practice_grid/owner.dart';

class AddOwner extends StatefulWidget {
  const AddOwner({super.key, required this.addFunc});

  final Function(Owner) addFunc;

  @override
  State<AddOwner> createState() => _AddOwnerState();
}

class _AddOwnerState extends State<AddOwner> {
  var namectrl = TextEditingController();

  var heightctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Owner')),
      body: Column(
        children: [
          SizedBox(height: 12),
          TextField(
            controller: namectrl,
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: heightctrl,
            decoration: InputDecoration(
              label: Text('Age'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => add(context),
            child: Text('Add Owner'),
          ),
        ],
      ),
    );
  }

  void add(context) {
    setState(() {
      String name = namectrl.text.trim();
      int height = int.tryParse(heightctrl.text.trim()) ?? 0;

      Owner owner = Owner(name: name, height: height);
      widget.addFunc(owner);
      Navigator.of(context).pop();
    });
  }
}
