import 'package:flutter/material.dart';
import 'package:practice_grid/first.dart';
import 'package:practice_grid/practice1/display.dart';
import 'package:practice_grid/practice1/item.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  List<Item> item1 = [
    Item(name: 'Item 1', color: Colors.red),
    Item(name: 'Item 2', color: Colors.red),
    Item(name: 'Item 3', color: Colors.green),
    Item(name: 'Item 4', color: Colors.green),
    Item(name: 'Item 5', color: Colors.red),
  ];

  List<Item> item2 = [
    Item(name: 'Item 1', color: Colors.red),
    Item(name: 'Item 2', color: Colors.green),
    Item(name: 'Item 3', color: Colors.red),
    Item(name: 'Item 4', color: Colors.green),
    Item(name: 'Item 5', color: Colors.red),
  ];

  bool show = true;

  @override
  Widget build(BuildContext context) {
    final current = show ? item1 : item2;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              },
              child: Text("Switch"),
            ),
          ),
          Expanded(
            child: show
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 3 / 2,
                        ),
                    itemCount: current.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = current[index];
                      return Display1(item: item);
                    },
                  )
                : GestureDetector(
                    onTap: () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => FirstScreen())),
                    child: ListView.builder(
                      itemCount: current.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = current[index];
                        return Card(
                          color: item.color,
                          child: ListTile(
                            title: Text(item.name),
                            subtitle: Text(item.name),
                            trailing: Text(item.name),
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
