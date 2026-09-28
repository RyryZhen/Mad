class Recipe {
  late int id;
  late int catID;
  late String name;
  late List<String> steps;
  late List<String> ingredients;
  late double duration;

  String? imageUrl;

  Recipe({
    required this.id,
    required this.catID,
    required this.name,
    required this.ingredients,
    required this.steps,
    this.duration = 0,
    this.imageUrl,
  });
}

//recipe.dart
