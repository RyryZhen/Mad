import 'dart:math';

import 'package:bike_buddy2/Components/categoryCard.dart';
import 'package:bike_buddy2/Components/pro_tips.dart';
import 'package:bike_buddy2/Components/tip_highlight.dart';
import 'package:bike_buddy2/Data/categoryList.dart';
import 'package:bike_buddy2/Data/pro_tips.dart';
import 'package:bike_buddy2/Data/tip_highlight.dart';
import 'package:bike_buddy2/Models/categoryCard.dart';
import 'package:bike_buddy2/Models/pro_tips.dart';
import 'package:bike_buddy2/Models/tip_highlight.dart';
import 'package:bike_buddy2/db_helper/database.dart';
import 'package:bike_buddy2/favorites.dart';
import 'package:flutter/material.dart';

//lib\home.dart
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BikeCategory> mylist = categories;
  final List<ProTip> tips = proTipsList;
  final List<dynamic> favoriteTips = [];
  late DailyTip randomTip;

  final DBHelper _db = DBHelper();

  String searchQuery = "";
  List<ProTip> filteredTips = [];

  @override
  void initState() {
    super.initState();
    randomTip = dailyBikeTips[Random().nextInt(dailyBikeTips.length)];
    filteredTips = proTipsList;

    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final dbItems = await _db.getAllFavorites();
    setState(() {
      favoriteTips.clear();
      for (var p in dbItems) {
        if (p.category == "Daily Tip") {
          favoriteTips.add(
            DailyTip(
              id: p.id - 9000,
              title: p.title,
              description: p.description,
            ),
          );
        } else {
          favoriteTips.add(p);
        }
      }
    });
  }

  bool _isFavorited(dynamic tip) {
    if (tip is ProTip) {
      return favoriteTips.any((f) => f is ProTip && f.id == tip.id);
    } else if (tip is DailyTip) {
      return favoriteTips.any((f) => f is DailyTip && f.id == tip.id);
    }
    return false;
  }

  void _filterTips(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredTips = proTipsList;
      } else {
        filteredTips = proTipsList
            .where(
              (tip) =>
                  tip.title.toLowerCase().contains(query.toLowerCase()) ||
                  tip.description.toLowerCase().contains(query.toLowerCase()) ||
                  tip.category.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  void _refreshTip() {
    setState(() {
      randomTip = dailyBikeTips[Random().nextInt(dailyBikeTips.length)];
    });
  }

  Future<void> toggleFavorite(dynamic tip) async {
    int dbId = (tip is DailyTip) ? tip.id + 9000 : tip.id;

    setState(() {
      bool alreadyExists = favoriteTips.any(
        (fav) => fav.id == tip.id && fav.runtimeType == tip.runtimeType,
      );

      if (alreadyExists) {
        favoriteTips.removeWhere(
          (fav) => fav.id == tip.id && fav.runtimeType == tip.runtimeType,
        );
        if (tip is ProTip) tip.isFavorite = false;

        _db.deleteById(dbId);
      } else {
        favoriteTips.add(tip);
        if (tip is ProTip) tip.isFavorite = true;

        Map<String, dynamic> dataToSave;
        if (tip is ProTip) {
          dataToSave = tip.toMap();
        } else {
          dataToSave = {
            'id': dbId,
            'title': 'Daily Tip',
            'description': tip.description,
            'iconCode': Icons.lightbulb.codePoint,
            'colorValue': Colors.blue.value,
            'category': 'Daily Tip',
          };
        }

        _db.insertFavorite(dataToSave);
      }
    });
  }

  void add() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const FavoritesScreen()))
        .then((_) async {
          _refreshTip();
          await _loadFavorites();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              );

              await _loadFavorites();
            },
            icon: Icon(
              Icons.favorite,
              color: favoriteTips.isEmpty ? Colors.grey : Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                onChanged: (value) => _filterTips(value),
                decoration: InputDecoration(
                  hintText: "Search tips (e.g., 'chain', 'speed')...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: DailyTipCard(
                tip: randomTip,
                isFavorited: _isFavorited(randomTip),
                onFavoriteToggle: () async => await toggleFavorite(randomTip),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 16, top: 10),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
              child: SizedBox(
                height: 160,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: mylist.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = mylist[index];
                    return CategoryCard(category: category);
                  },
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Row(
                children: [
                  const Text(
                    'Buddy Tips',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 8),

                  if (searchQuery.isNotEmpty)
                    Text(
                      "(${filteredTips.length} found)",
                      style: TextStyle(color: Colors.blue[700], fontSize: 14),
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
              child: filteredTips.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("No tips found for '$searchQuery'"),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                      itemCount: filteredTips.length,
                      itemBuilder: (context, index) {
                        final tip = filteredTips[index];
                        return ProTipCard(
                          tip: tip,
                          isFavorited: _isFavorited(tip),
                          onFavoriteToggle: (p) async =>
                              await toggleFavorite(p),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }
}
