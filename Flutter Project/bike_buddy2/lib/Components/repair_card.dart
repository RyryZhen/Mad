import 'package:bike_buddy2/Models/categoryCard.dart';
import 'package:bike_buddy2/Models/repair_selection.dart';
import 'package:flutter/material.dart';

//lib\Components\repair_card.dart
class RepairCard extends StatelessWidget {
  const RepairCard({super.key, required this.repair, required this.category});

  final Repairs repair;
  final BikeCategory category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),

        child: Stack(
          children: [
            if (repair.avatarPath != null)
              Positioned.fill(
                child: Image.asset(
                  repair.avatarPath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 48,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
            Center(
              child: Text(
                repair.title.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  letterSpacing: -1,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 10.0,
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                    ),
                    Shadow(
                      offset: Offset(0, 0),
                      blurRadius: 20.0,
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
