import 'package:a8_recipe_app/models/category.dart';
import 'package:a8_recipe_app/screens/recipe_listing/recipe_listing_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => RecipeListingScreen(category: category),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          gradient: LinearGradient(
            colors: [category.color, category.color.withOpacity(0.65)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(child: Text(category.name)),
      ),
    );
  }
}
//category_tile_component.dart