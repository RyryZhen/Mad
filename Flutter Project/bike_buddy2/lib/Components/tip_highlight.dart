import 'package:bike_buddy2/Models/tip_highlight.dart';
import 'package:bike_buddy2/db_helper/database.dart';
import 'package:flutter/material.dart';

//lib\Components\tip_highlight.dart
class DailyTipCard extends StatefulWidget {
  final DailyTip tip;
  final bool isFavorited;
  final VoidCallback onFavoriteToggle;

  const DailyTipCard({
    super.key,
    required this.tip,
    required this.isFavorited,
    required this.onFavoriteToggle,
  });

  @override
  State<DailyTipCard> createState() => _DailyTipCardState();
}

class _DailyTipCardState extends State<DailyTipCard> {
  void toggleFavorite(dynamic tip) async {
    final int dbId = (tip is DailyTip) ? tip.id + 9000 : tip.id;

    final db = await DBHelper().database;
    final List<Map<String, dynamic>> existing = await db.query(
      DBHelper.table,
      where: 'id = ?',
      whereArgs: [dbId],
    );

    if (existing.isNotEmpty) {
      await DBHelper().deleteById(dbId);
    } else {
      await DBHelper().insertFavorite(tip.toMap());
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade500],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Icon(
                Icons.lightbulb,
                size: 100,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: Colors.amber,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "DAILY BUDDY TIP",
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      IconButton(
                        icon: Icon(
                          widget.isFavorited
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: widget.isFavorited
                              ? Colors.redAccent
                              : Colors.white,
                        ),
                        onPressed: () async {
                          toggleFavorite(widget.tip);

                          widget.onFavoriteToggle();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.tip.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Tap heart to save for later",
                    style: TextStyle(color: Colors.white54, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
