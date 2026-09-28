import 'package:flutter/material.dart';
import 'package:student_practice/list.dart';

class ArchiveScreen extends StatelessWidget {
  final List<LIST> archived;

  const ArchiveScreen({super.key, required this.archived});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Archived Students")),
      body: ListView.builder(
        itemCount: archived.length,
        itemBuilder: (context, index) {
          final student = archived[index];
          return ListTile(
            title: Text('${student.fname} ${student.lname}'),
            subtitle: Text('${student.age}'),
            leading: CircleAvatar(
              child: Text('${student.fname[0]}${student.lname[0]}'),
            ),
          );
        },
      ),
    );
  }
}
