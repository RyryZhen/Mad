class RepairSubtopic {
  //lib\Models\repair_content.dart
  final int id;
  final String title;
  final String? avatarPath;
  final String description;
  final List<String> tools;
  final List<String> steps;

  RepairSubtopic({
    required this.id,
    required this.title,
    this.avatarPath,
    required this.description,
    required this.tools,
    required this.steps,
  });
}
