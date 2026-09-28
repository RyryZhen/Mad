import 'package:bike_buddy2/Models/categoryCard.dart';
import 'package:bike_buddy2/repair_selection.dart';
import 'package:flutter/material.dart';

//lib\Components\categoryCard.dart
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final BikeCategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => RepairSelection(category: category)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color,
              Color.fromRGBO(
                category.color.red,
                category.color.green,
                category.color.blue,
                0.65,
              ),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              if (category.iconPath != null)
                Center(
                  child: Image.asset(
                    category.iconPath!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 48,
                      color: Colors.white70,
                    ),
                  ),
                ),
              Positioned(
                right: 8,
                bottom: 8,
                child: Text(
                  category.type.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
