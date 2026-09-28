import 'package:bike_buddy2/Models/repair_content.dart';
import 'package:flutter/material.dart';

//lib\Components\repair_content.dart
class SubtopicTile extends StatelessWidget {
  const SubtopicTile({
    super.key,
    required this.subtopic,
    this.selected = false,
    this.onTap,
  });

  final RepairSubtopic subtopic;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 140,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.white70,
            borderRadius: BorderRadius.circular(12),
            boxShadow: selected
                ? [BoxShadow(color: Colors.black12, blurRadius: 4)]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (subtopic.avatarPath != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 6),
                  child: SizedBox(
                    height: 64,
                    child: Image.asset(
                      subtopic.avatarPath!,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.settings_suggest, size: 40),
                    ),
                  ),
                ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subtopic.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToolsList extends StatelessWidget {
  const ToolsList({super.key, required this.tools});
  final List<String> tools;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tools.length,
      itemBuilder: (context, i) {
        final tool = tools[i];
        return ListTile(leading: const Icon(Icons.build), title: Text(tool));
      },
    );
  }
}

class StepsList extends StatelessWidget {
  const StepsList({super.key, required this.steps});
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: steps.length,
      itemBuilder: (context, i) {
        final step = steps[i];
        return ListTile(
          leading: CircleAvatar(child: Text('${i + 1}')),
          title: Text(step),
        );
      },
    );
  }
}
