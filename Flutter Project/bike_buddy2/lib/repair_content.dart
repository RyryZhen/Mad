import 'package:bike_buddy2/Models/categoryCard.dart';
import 'package:bike_buddy2/Models/repair_content.dart';
import 'package:bike_buddy2/Models/repair_selection.dart';
import 'package:bike_buddy2/components/repair_content.dart';
import 'package:bike_buddy2/data/repair_content.dart';
import 'package:flutter/material.dart';

//lib\repair_content.dart
class RepairContent extends StatefulWidget {
  const RepairContent({
    super.key,
    required this.repair,
    required this.category,
  });

  final Repairs repair;
  final BikeCategory category;

  @override
  State<RepairContent> createState() => _RepairContentState();
}

class _RepairContentState extends State<RepairContent>
    with SingleTickerProviderStateMixin {
  late List<RepairSubtopic> _subtopics;
  int _selected = -1;

  @override
  void initState() {
    super.initState();

    List<RepairSubtopic> baseList = repairContent[widget.repair.title] ?? [];

    _subtopics = baseList.map((sub) {
      if (sub.title == 'Fork') {
        if (['MOUNTAIN', 'X-CROSS'].contains(widget.category.type)) {
          return allSubtopics['suspension_fork']!;
        } else {
          return allSubtopics['rigid_fork']!;
        }
      }

      if (widget.category.type == 'X-CROSS' && sub.title == 'Frame') {}

      return sub;
    }).toList();

    if (widget.category.type == 'FIXIE') {
      _subtopics.removeWhere(
        (sub) =>
            sub.title.contains('Derailleur') || sub.title.contains('Brake'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final RepairSubtopic? selectedSub =
        (_selected >= 0 && _selected < _subtopics.length)
        ? _subtopics[_selected]
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedSub?.title ?? 'Fix your ${widget.repair.title}'),
        backgroundColor: widget.category.color,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('${widget.repair.title} info'),
                  content: Text(widget.repair.description ?? ''),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_subtopics.isNotEmpty)
            SizedBox(
              height: 160,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: _subtopics.length,
                itemBuilder: (context, i) => SubtopicTile(
                  subtopic: _subtopics[i],
                  selected: i == _selected,
                  onTap: () =>
                      setState(() => _selected = i == _selected ? -1 : i),
                ),
              ),
            )
          else
            const SizedBox(
              height: 120,
              child: Center(child: Text('No data for this category')),
            ),

          if (selectedSub != null)
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.shade200,
                      child: TabBar(
                        labelColor: widget.category.color,
                        unselectedLabelColor: Colors.black54,
                        tabs: const [
                          Tab(text: 'Tools'),
                          Tab(text: 'Steps'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ToolsList(tools: selectedSub.tools),
                          StepsList(steps: selectedSub.steps),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(
                  'Tap a part above to see tools and steps',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
