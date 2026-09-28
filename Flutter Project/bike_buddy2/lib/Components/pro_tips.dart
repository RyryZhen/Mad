import 'package:bike_buddy2/Models/pro_tips.dart';
import 'package:bike_buddy2/pro_tips.dart';
import 'package:flutter/material.dart';

//lib\Components\pro_tips.dart
class ProTipCard extends StatelessWidget {
  final ProTip tip;
  final bool isFavorited;
  final Future<void> Function(ProTip) onFavoriteToggle;

  const ProTipCard({
    super.key,
    required this.tip,
    required this.isFavorited,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProTipScreen(
              tip: tip,
              initialIsFavorited: isFavorited,
              onToggleFavorite: onFavoriteToggle,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: tip.color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: tip.color.withOpacity(0.5)),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(tip.icon, color: tip.color, size: 26),
                  const SizedBox(height: 8),
                  Text(
                    tip.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
