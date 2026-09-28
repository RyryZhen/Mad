import 'package:bike_buddy2/Components/tip_highlight.dart';
import 'package:bike_buddy2/Models/pro_tips.dart';
import 'package:bike_buddy2/Models/tip_highlight.dart';
import 'package:bike_buddy2/db_helper/database.dart';
import 'package:flutter/material.dart';

//lib\favorites.dart
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final DBHelper _db = DBHelper();
  List<dynamic> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    display();
  }

  Future<void> display() async {
    if (!mounted) return;
    setState(() => _isLoading = true);

    try {
      final items = await _db.getAllFavorites();
      if (mounted) {
        setState(() {
          _favorites = items;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error loading favorites: $e");
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _removeFavorite(dynamic item) async {
    final int idToDelete = (item is DailyTip) ? item.id + 9000 : item.id;

    try {
      await _db.deleteById(idToDelete);

      if (mounted) {
        setState(() {
          _favorites.removeWhere(
            (element) =>
                (element is DailyTip &&
                    item is DailyTip &&
                    element.id == item.id) ||
                (element is ProTip && item is ProTip && element.id == item.id),
          );
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Removed from favorites"),
            duration: Duration(milliseconds: 800),
          ),
        );
      }
    } catch (e) {
      debugPrint("Could not remove favorite: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to remove favorite")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorites"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              if (_favorites.isEmpty) return;

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Clear All Favorites?"),
                    content: const Text(
                      "Are you sure you want to remove all saved tips? This action cannot be undone.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("CANCEL"),
                      ),

                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);

                          await _db.clearAll();

                          display();

                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "All favorites have been cleared",
                                ),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        child: const Text(
                          "CLEAR ALL",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favorites.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                final item = _favorites[index];

                if (item is DailyTip) {
                  return DailyTipCard(
                    tip: item,
                    isFavorited: true,

                    onFavoriteToggle: () => _removeFavorite(item),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: unselect, icon: Icon(Icons.favorite)),

          const SizedBox(height: 16),
          Text(
            "No favorites yet!",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tips you heart will appear here",
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ],
      ),
    );
  }

  void unselect() {
    setState(() {
      Navigator.of(context).pop();
    });
  }
}
