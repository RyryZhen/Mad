// import 'package:flutter/material.dart';

// class RecipeView extends StatelessWidget {
//   const RecipeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text("This is the Second Screen")));
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_grid/addOwner.dart';
import 'package:practice_grid/owner.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Owner> mylist = [Owner(name: 'Ryan', height: 175)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        actions: [
          IconButton(onPressed: () => add(context), icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(mylist[index].name),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Confirm Delete"),
                  content: Text('Are you Sure'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          mylist.removeAt(index);
                          Navigator.of(context).pop(true);
                        });
                      },
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            },
            child: ListTile(
              title: Text(mylist[index].name),
              subtitle: Text('Height: ${mylist[index].height}'),
              trailing: Text('Owner'),
            ),
          );
        },
      ),
    );
  }

  void add(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddOwner(
          addFunc: (owner) {
            setState(() {
              mylist.add(owner);
            });
          },
        ),
      ),
    );
  }
}
