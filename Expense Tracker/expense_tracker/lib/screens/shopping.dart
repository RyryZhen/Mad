import 'package:expense_tracker/screens/items.dart';
import 'package:flutter/material.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<Items> myItems = [];

  var itemCtrl = TextEditingController();

  //  void addItem() {
  //     var item = ExpenseList(
  //       name: nameCtrl.text,
  //       amount: double.parse(amountCtrl.text),
  //       date: date!,
  //     );
  //     setState(() {
  //       myList.add(item);
  //       Navigator.of(context).pop();
  //     });
  //   }

  void addItem() {
    var item = Items(item: itemCtrl.text);
    setState(() {
      myItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Shopping List'),
        leading: IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: const Icon(Icons.delete_sweep), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: itemCtrl,
                        decoration: InputDecoration(
                          label: Text('Item'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: TextButton(
                            onPressed: addItem,
                            child: Text('Add'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: myItems
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Text(item.item),
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.check_box),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
