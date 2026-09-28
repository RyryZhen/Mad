import 'package:flutter/material.dart';
import 'package:practice_grid/practice2/item.dart';
import 'package:practice_grid/practice2/second.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var namectrl = TextEditingController();

  List<ItemTile> mylist = [ItemTile(name: 'Ryan')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: namectrl,
                  decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: add,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.zero,
                      ),
                    ),
                    child: Text('Add'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (BuildContext context, int index) {
                final track = mylist[index];
                return Dismissible(
                  key: Key(track.name),
                  direction: DismissDirection.startToEnd,
                  background: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 70),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                  confirmDismiss: (startToEnd) async {
                    return await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Confirm Delete'),
                        content: Text(
                          'Are you sure you want to delete this item?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                mylist.removeAt(index);
                                Navigator.of(context).pop(true);
                              });
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },

                  child: GestureDetector(
                    onTap: () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => SecondSc())),
                    child: Card(
                      child: ListTile(
                        title: Text(track.name),
                        leading: CircleAvatar(child: Text(track.name[0])),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void add() {
    String name = namectrl.text.trim();

    setState(() {
      mylist.add(ItemTile(name: name));
      namectrl.clear();
    });
  }
}
