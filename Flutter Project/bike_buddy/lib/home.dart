import 'package:bike_buddy/category_model.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Category> mylist = [Category(title: 'Title', color: Colors.red)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.person))],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
        ),
        itemCount: mylist.length,
        itemBuilder: (BuildContext context, int index) {
          final trace = mylist[index];
          return Card(
            child: ListTile(
              title: Center(child: Text(trace.title)),
              tileColor: trace.color,
            ),
          );
        },
      ),
    );
  }
}
