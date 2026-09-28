// import 'package:flutter/material.dart';
// import 'package:student_practice/addscreen.dart';
// import 'package:student_practice/archive.dart';
// import 'package:student_practice/list.dart';

// class Tester extends StatefulWidget {
//   const Tester({super.key});

//   @override
//   State<Tester> createState() => _TesterState();
// }

// class _TesterState extends State<Tester> {
//   List<LIST> myList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Student"),
//         actions: [
//           IconButton(onPressed: archive, icon: Icon(Icons.archive)),
//           IconButton(onPressed: add, icon: Icon(Icons.add)),
//         ],
//         backgroundColor: Colors.blueGrey,
//         foregroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: myList.length,
//         itemBuilder: (context, index) {
//           final student = myList[index];
//           return Dismissible(
//             key: ValueKey(student),

//             //direction: DismissDirection.startToEnd,
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.only(left: 20),
//               child: Icon(Icons.delete, color: Colors.white),
//             ),
//             confirmDismiss: (direction) async {
//               return await showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text("Confirm Delete"),
//                   content: Text('Do you want to delete this Item?'),
//                   actions: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(false);
//                       },
//                       child: Text("Cancel"),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop(true);
//                       },
//                       child: Text("Delete"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             secondaryBackground: Container(
//               color: Colors.blue,
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.only(right: 20),
//               child: Icon(Icons.archive, color: Colors.white),
//             ),
//             onDismissed: (direction) {
//               final remove = myList[index];
//               setState(() {
//                 myList.removeAt(index);
//               });
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text("${remove.fname} deleted"),
//                   action: SnackBarAction(
//                     label: "Undo",
//                     onPressed: () {
//                       setState(() {
//                         myList.insert(index, remove);
//                       });
//                     },
//                   ),
//                 ),
//               );
//             },
//             child: ListTile(
//               title: Text('${student.fname} ${student.lname}'),
//               subtitle: Text('${student.age}'),
//               leading: CircleAvatar(
//                 child: Text('${student.fname[0]} ${student.lname[0]}'),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void add() {
//     setState(() {
//       Navigator.of(
//         context,
//       ).push(MaterialPageRoute(builder: (_) => Addscreen(add: newAdd)));
//     });
//   }

//   newAdd(LIST s) {
//     myList.add(s);
//     setState(() {});
//   }

//   void archive() {
//     setState(() {
//       Navigator.of(
//         context,
//       ).push(MaterialPageRoute(builder: (_) => Archive(add: add)));
//     });
//   }
// }
