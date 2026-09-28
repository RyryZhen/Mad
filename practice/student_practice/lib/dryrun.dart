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
//   List<LIST> archivedList = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Student"),
//         actions: [
//           IconButton(onPressed: archive, icon: const Icon(Icons.archive)),
//           IconButton(onPressed: add, icon: const Icon(Icons.add)),
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
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerLeft,
//               padding: const EdgeInsets.only(left: 20),
//               child: const Icon(Icons.delete, color: Colors.white),
//             ),
//             secondaryBackground: Container(
//               color: Colors.blue,
//               alignment: Alignment.centerRight,
//               padding: const EdgeInsets.only(right: 20),
//               child: const Icon(Icons.archive, color: Colors.white),
//             ),

//             // Different behavior depending on swipe direction
//             confirmDismiss: (direction) async {
//               if (direction == DismissDirection.startToEnd) {
//                 // Left → Right = Confirm Delete
//                 return await showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text("Confirm Delete"),
//                     content: const Text('Do you want to delete this Item?'),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(false),
//                         child: const Text("Cancel"),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.of(context).pop(true),
//                         child: const Text("Delete"),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 // Right → Left = Archive directly (no confirm)
//                 setState(() {
//                   archivedList.add(myList[index]);
//                 });
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("${student.fname} archived")),
//                 );
//                 return true; // allow dismiss
//               }
//             },

//             onDismissed: (direction) {
//               final removed = myList[index];
//               setState(() {
//                 myList.removeAt(index);
//               });

//               if (direction == DismissDirection.startToEnd) {
//                 // Deleted
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text("${removed.fname} deleted"),
//                     action: SnackBarAction(
//                       label: "Undo",
//                       onPressed: () {
//                         setState(() {
//                           myList.insert(index, removed);
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               } else {
//                 // Archived
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("${removed.fname} archived")),
//                 );
//               }
//             },

//             child: ListTile(
//               title: Text('${student.fname} ${student.lname}'),
//               subtitle: Text('${student.age}'),
//               leading: CircleAvatar(
//                 child: Text('${student.fname[0]}${student.lname[0]}'),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void add() {
//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => Addscreen(add: newAdd)),
//     );
//   }

//   void newAdd(LIST s) {
//     setState(() {
//       myList.add(s);
//     });
//   }

//   void archive() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (_) => Archive(list: archivedList),
//       ),
//     );
//   }
// }
