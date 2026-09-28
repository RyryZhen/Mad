import 'package:db_practice2/db/db_helper.dart';
import 'package:db_practice2/item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> mylist = [];
  var namectrl = TextEditingController();
  var searchctrl = TextEditingController();

  DbHelper dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();
    display();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: namectrl,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: insert, child: Text('Insert')),
          SizedBox(height: 20),
          TextField(
            controller: searchctrl,
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          // ElevatedButton(onPressed: search, child: Text('Search')),
          Expanded(
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (BuildContext context, int index) {
                final item = mylist[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit button
                      // IconButton(
                      //   icon: Icon(Icons.edit, color: Colors.blue),
                      //   onPressed: () => editDialog(item),
                      // ),
                      // Delete button
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => delete(item.id!),
                      ),
                      TextButton(
                        onPressed: () => updater(item),
                        child: Text('Edit'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void display() async {
    mylist = await dbHelper.displaying();
    setState(() {});
  }

  void insert() async {
    String name = namectrl.text.trim();
    var item = Item(name: name);

    await dbHelper.insertion(item);
    namectrl.clear();
    display();
  }

  void delete(int id) async {
    await dbHelper.deleting(id);
    display();
  }

  void search() async {
    String keyword = searchctrl.text.trim();
    if (keyword.isEmpty) {
      display(); // if search is empty, show all
      return;
    }
    mylist = await dbHelper.searching(keyword);
    setState(() {});
  }

  void updater(Item item) {
    namectrl.text = item.name;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Update User'),
        content: TextField(
          controller: namectrl,
          decoration: InputDecoration(
            label: Text('Name'),
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              String name = namectrl.text.trim();
              await dbHelper.updating(Item(name: name));
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  // void display() async {
  //   mylist = await dbHelper.displaying();
  //   setState(() {});
  // }
  // void display() async {
  //   mylist = await dbHelper.displaying();
  //   setState(() {});
  // }

  // void insert() async {
  //   String name = namectrl.text.trim();
  //   var item = Item(name: name);
  //   await dbHelper.insertion(item);
  //   namectrl.clear();
  //   display();
  // }

  // void delete(int id) async {
  //   await dbHelper.deleting(id);
  //   display();
  // }

  // void clearAll() async {
  //   await dbHelper.clearAll();
  //   display();
  // }

  // Edit item using a dialog
  // void editDialog(Item item) {
  //   namectrl.text = item.name;
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text('Edit Item'),
  //       content: TextField(
  //         controller: namectrl,
  //         decoration: InputDecoration(labelText: 'Name'),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text('Cancel'),
  //         ),

  //         ElevatedButton(onPressed: () {}, child: Text("Clear All")),
  //         TextButton(
  //           onPressed: () async {
  //             String newName = namectrl.text.trim();
  //             if (newName.isEmpty) return;

  //             var newItem = Item(id: item.id, name: newName);
  //             //await dbHelper.updating(newItem);
  //             namectrl.clear();
  //             Navigator.pop(context);
  //             display();
  //           },
  //           child: Text('Update'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

  // void insert() async {
  //   String name = namectrl.text.trim();
  //   var item = Item(name: name);

  //   await dbHelper.insertion(item);
  //   namectrl.clear();
  //   display();
  // }


  // void delete(int id) async {
  //   await dbHelper.deleting(id);
  //   display();
  // }

  // Display all items
  //   void display() async {
  //     mylist = await dbHelper.display();
  //     setState(() {});
  //   }

  //   // Insert new item
  //   void insert() async {
  //     String name = namectrl.text.trim();
  //     if (name.isEmpty) return;

  //     var item = Item(name: name);
  //     await dbHelper.insertItem(item);
  //     namectrl.clear();
  //     display();
  //   }

  //   // Delete item
  //   void delete(int id) async {
  //     await dbHelper.deleteItem(id);
  //     display();
  //   }

  
  // import 'package:db_practice2/db/db_helper.dart';
  // import 'package:db_practice2/item.dart';
  // import 'package:flutter/material.dart';

  // class Home extends StatefulWidget {
  //   const Home({super.key});

  //   @override
  //   State<Home> createState() => _HomeState();
  // }

  // class _HomeState extends State<Home> {
  //   List<Item> mylist = [];

  //   var namectrl = TextEditingController();

  //   DbHelper dbHelper = DbHelper();

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: Column(
  //         children: [
  //           SizedBox(height: 50),
  //           TextField(
  //             controller: namectrl,
  //             decoration: InputDecoration(
  //               label: Text('Name'),
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           ElevatedButton(onPressed: insert, child: Text('Insert')),
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: mylist.length,
  //               itemBuilder: (BuildContext context, int index) {
  //                 final thing = mylist[index];
  //                 return ListTile(title: Text(thing.name));
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   @override
  //   void initState() {
  //     super.initState();
  //     display();
  //   }

  //   void display() async {
  //     await dbHelper.display();
  //     mylist = await dbHelper.display();
  //     setState(() {});

  //   }

  //   void insert() async {
  //     String name = namectrl.text.trim();

  //     var item = Item(name: name);
  //     await dbHelper.insertItem(item);
  //     display();
  //   }
  // }

  // //home.dart
