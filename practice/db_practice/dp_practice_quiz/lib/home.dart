import 'package:dp_practice_quiz/database/db_helper.dart';
import 'package:dp_practice_quiz/product.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> mylist = [];
  var namectrl = TextEditingController();
  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    display(); // load items from database
  }

  // Load items from database and update the UI
  void display() async {
    mylist = await dbHelper.display();
    setState(() {});
  }

  // Insert a new item into the database
  void insert() async {
    String name = namectrl.text.trim();
    if (name.isEmpty) return; // avoid empty inserts

    var item = Item(name: name);
    await dbHelper.insertItem(item);

    namectrl.clear();
    display(); // refresh the list
  }

  // Delete an item from the database
  // void deleteItem(int id) async {
  //   await dbHelper.deleteItem(id);
  //   display(); // refresh the list
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: namectrl,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: insert, child: Text('Insert')),
          Expanded(
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                final item = mylist[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
