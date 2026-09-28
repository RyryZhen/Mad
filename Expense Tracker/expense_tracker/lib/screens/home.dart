import 'package:expense_tracker/screens/list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ExpenseList> myList = [];

  DateTime? date;

  var nameCtrl = TextEditingController();
  var amountCtrl = TextEditingController();
  var dateCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses'),
        actions: [IconButton(onPressed: addInput, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: myList
            .map(
              (item) => Card(
                color: Colors.lightGreen,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.amount.toString()),
                          Text(item.date.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  void addInput() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          children: [
            SizedBox(height: 20),
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountCtrl,
              decoration: InputDecoration(
                label: Text('Amount'),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: dateCtrl,
              readOnly: true,
              decoration: InputDecoration(
                label: Text('Date'),
                border: OutlineInputBorder(),
                suffix: IconButton(
                  onPressed: selectDate,
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: cancel, child: Text('Cancel')),
                ElevatedButton(onPressed: addItem, child: Text('Add')),
                ElevatedButton(
                  onPressed: clear,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void selectDate() async {
    date = await showDatePicker(
      context: context,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        dateCtrl.text = date!.toString();
      });
    }
  }

  void addItem() {
    var item = ExpenseList(
      name: nameCtrl.text,
      amount: double.parse(amountCtrl.text),
      date: date!,
    );
    setState(() {
      myList.add(item);
      Navigator.of(context).pop();
    });
  }

  void cancel() {
    Navigator.of(context).pop();
  }

  void clear() {
    setState(() {
      myList.clear();
      // nameCtrl.clear();
      // amountCtrl.clear();
      // dateCtrl.clear();
    });
  }
}
