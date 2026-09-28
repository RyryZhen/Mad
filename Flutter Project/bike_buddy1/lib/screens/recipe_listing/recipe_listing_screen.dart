import 'package:a8_recipe_app/data/recipes.dart';
import 'package:a8_recipe_app/models/category.dart';
import 'package:a8_recipe_app/screens/recipe_listing/recipe_tile_component.dart';
import 'package:flutter/material.dart';

class RecipeListingScreen extends StatelessWidget {
  const RecipeListingScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final filteredRecipes = recipes
        .where((item) => item.catID == category.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      body: Padding( 
        padding: const EdgeInsets.all(8.0),
        child: filteredRecipes.isNotEmpty
            ? ListView.builder(
                itemBuilder: (_, index) {
                  final recipe = filteredRecipes[index];
                  return RecipeTile(
                    recipe: recipe,
                    categoryColor: category.color,
                  );
                },

                itemCount: filteredRecipes.length,
              )
            : Center(child: Text('No Available Recipes')),
      ),
    );
  }
}
//recipe_listing_screen.dart