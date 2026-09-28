import 'package:db_practice3/model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Item> mylist = [];
  var namectrl = TextEditingController();

  void addItem(Color color) {
    if (namectrl.text.isEmpty) return;

    setState(() {
      mylist.add(Item(name: namectrl.text, color: color));
      namectrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: namectrl,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              // RED BUTTON
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      mylist.add(Item(name: namectrl.text, color: Colors.red));
                    });
                  },
                  child: const Text('RED', style: TextStyle(color: Colors.red)),
                ),
              ),

              // BLUE BUTTON
              Expanded(
                child: TextButton(
                  onPressed: () => addItem(Colors.blue),
                  child: const Text(
                    'BLUE',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: mylist.length,
              itemBuilder: (context, index) {
                final item = mylist[index];
                return Card(
                  child: ListTile(
                    title: Text(item.name),
                    tileColor: item.color,
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

//   List<Item> mylist = [];

//   var namectrl = TextEditingController();

//   DBHelper helper = DBHelper();

//   @override
//   void initState() {
//     super.initState();
//     // display();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hello'),
//         actions: [IconButton(onPressed: null, icon: Icon(Icons.delete))],
//       ),
//       body: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: namectrl,
//                   decoration: InputDecoration(
//                     label: Text('Name'),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ),
//               Expanded(child: TextButton(onPressed: null, child: Text('ADD'))),
//               Expanded(
//                 child: TextButton(onPressed: null, child: Text('Delete')),
//               ),

//                Expanded(child: TextButton(onPressed: (){}, child: Text('RED'))),
//               Expanded(
//                 child: TextButton(onPressed: null, child: Text('RED')),
//               ),
//             ],
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: mylist.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final trace = mylist[index];
//                 return ListTile(title: Text(trace.name), tileColor: Colors.red);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
