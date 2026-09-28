import 'package:flutter/material.dart';

import 'package:letter_quest/dbhelper.dart';
import 'package:letter_quest/model/flashcard.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final DbHelper _dbHelper = DbHelper();
  List<Flashcard> savedFavorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    display();
  }

  void display() async {
    setState(() => isLoading = true);
    final data = await _dbHelper.getFavorites();
    setState(() {
      savedFavorites = data;
      isLoading = false;
    });
  }

  void deleteFavorite(int? id) async {
    if (id != null) {
      await _dbHelper.deleteFlashcard(id);
      display();
    }
  }

  void _showClearConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Clear All Favorites?'),
        content: const Text(
          'This will remove all cards from your saved favorites forever.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () async {
              await _dbHelper.clearDatabase();
              display();
              if (mounted) Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      appBar: AppBar(
        title: const Text('My Favorites'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          if (savedFavorites.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.cleaning_services_rounded, size: 28),
              onPressed: _showClearConfirmation,
              tooltip: 'Clear All Favorites',
            ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.orange))
          : savedFavorites.isEmpty
          ? _buildEmptyState()
          : GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.85,
              ),
              itemCount: savedFavorites.length,
              itemBuilder: (context, index) {
                final card = savedFavorites[index];
                return _buildFavoriteCard(card);
              },
            ),
    );
  }

  Widget _buildFavoriteCard(Flashcard card) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          color: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    card.image,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
                child: Text(
                  card.word,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.redAccent),
            onPressed: () => deleteFavorite(card.id),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border_rounded,
            size: 80,
            color: Colors.orange.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          const Text(
            "Your favorites list is empty!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Go to the gallery and tap the star!",
            style: TextStyle(fontSize: 14, color: Colors.black26),
          ),
        ],
      ),
    );
  }
}
