import 'package:bike_buddy2/Data/repair_selection.dart';
import 'package:bike_buddy2/Models/categoryCard.dart';
import 'package:bike_buddy2/Models/repair_selection.dart';
import 'package:bike_buddy2/repair_content.dart';
import 'package:flutter/material.dart';

//lib\repair_selection.dart
class RepairSelection extends StatelessWidget {
  RepairSelection({super.key, required this.category});

  final List<Repairs> mylist = repairs;
  final BikeCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Where's the problem?"),
        backgroundColor: category.color,
        foregroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context) {
          final List<Repairs> displayList = (category.type == 'FIXIE')
              ? mylist.where((r) => r.title != 'Brakeset').toList()
              : mylist;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: displayList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              final repair = displayList[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        RepairContent(repair: repair, category: category),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: repair.avatarPath != null
                            ? Image.asset(
                                repair.avatarPath!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      color: Colors.grey.shade300,
                                      child: const Icon(
                                        Icons.broken_image,
                                        size: 40,
                                      ),
                                    ),
                              )
                            : Container(color: category.color.withOpacity(0.5)),
                      ),

                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            repair.title.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                              shadows: [
                                Shadow(
                                  blurRadius: 8,
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
