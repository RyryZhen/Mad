import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController itemCtrl = TextEditingController();
  List<String> mylist = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Load saved data
  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    mylist = prefs.getStringList('mylist') ?? [];
    setState(() {});
  }

  // Save data
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('mylist', mylist);
  }

  // Clear all
  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    mylist.clear();
    setState(() {});
  }

  // Add item
  void add() {
    if (itemCtrl.text.isEmpty) return;

    setState(() {
      mylist.add(itemCtrl.text);
    });

    saveData();
    itemCtrl.clear();
  }

  // Remove single item
  void removeItem(int index) {
    setState(() {
      mylist.removeAt(index);
    });
    saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My mylist"),
        actions: [
          IconButton(onPressed: clearData, icon: const Icon(Icons.delete)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: itemCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Item",
                ),
              ),
            ),

            ElevatedButton(onPressed: add, child: const Text("Add")),

            Expanded(
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (context, index) {
                  final track = mylist[index];

                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      removeItem(index);
                    },
                    child: Card(child: ListTile(title: Text(track))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
