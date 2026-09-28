import 'package:a8_recipe_app/data/categories.dart';
import 'package:a8_recipe_app/screens/categories/category_tile_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 30,
            crossAxisSpacing: 8,
            childAspectRatio: 20 / 18,
          ),
          itemBuilder: (_, index) {
            final category = categories[index];
            return CategoryTile(category: category);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
//category_screen.dart