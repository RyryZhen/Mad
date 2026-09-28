import 'package:a8_recipe_app/models/recipe.dart';
import 'package:a8_recipe_app/screens/recipe_view/recipe_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({
    super.key,
    required this.recipe,
    required this.categoryColor,
  });

  final Recipe recipe;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) =>
              RecipeViewScreen(recipe: recipe, categoryColor: categoryColor),
        ),
      ),

      child: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 3 / 2,
                    child: recipe.imageUrl != null
                        ? Image.network(recipe.imageUrl!, fit: BoxFit.cover)
                        : const Text('No Available Image'),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.black.withOpacity(0.4),
                      child: Text(
                        recipe.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.timer),
                const Gap(6),
                Text(
                  '${recipe.duration} min',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Gap(12),
          ],
        ),
      ),
    );
  }
}
//recipe_tile_component.dart