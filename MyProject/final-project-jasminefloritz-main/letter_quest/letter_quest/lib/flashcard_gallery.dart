import 'package:flutter/material.dart';
import 'package:letter_quest/dbhelper.dart';
import 'package:letter_quest/model/flashcard.dart';
import 'package:letter_quest/model/favorites_data.dart';
import 'package:letter_quest/model/flashcard_data.dart';

class FlashcardGallery extends StatefulWidget {
  final String letter;
  final Color themeColor;
  final List<Flashcard>? customCards;

  const FlashcardGallery({
    super.key,
    required this.letter,
    required this.themeColor,
    this.customCards,
  });

  @override
  State<FlashcardGallery> createState() => _FlashcardGalleryState();
}

class _FlashcardGalleryState extends State<FlashcardGallery> {
  late List<Flashcard> cards;
  final DbHelper _dbHelper = DbHelper();

  @override
  void initState() {
    super.initState();

    cards = widget.customCards ?? (flashcardData[widget.letter] ?? []);

    _syncFavoritesWithDb();
  }

  Future<void> _syncFavoritesWithDb() async {
    for (var card in cards) {
      final int? dbId = await _dbHelper.getFavoriteId(card.word);
      if (mounted) {
        setState(() {
          if (dbId != null) {
            card.isFavorite = true;
            card.id = dbId;
          } else {
            card.isFavorite = false;
            card.id = null;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = widget.letter == "Shuffle"
        ? Colors.orange
        : widget.themeColor;

    return Scaffold(
      backgroundColor: activeColor.withOpacity(0.1),
      appBar: AppBar(
        title: Text(
          widget.letter == "Shuffle"
              ? 'Shuffle Flashcard Gallery'
              : 'Letter ${widget.letter} Exploration',
        ),
        backgroundColor: activeColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          String displayLetter = widget.letter == "Shuffle"
              ? card.word[0].toUpperCase()
              : widget.letter;

          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.transparent,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Text(
                              displayLetter,
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: activeColor,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              card.image,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.image_not_supported,
                                    size: 100,
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: activeColor,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            card.word,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: Icon(
                          card.isFavorite
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.orange[800],
                          size: 45,
                        ),
                        onPressed: () async {
                          if (!card.isFavorite) {
                            int savedId = await _dbHelper.insertFlashcard(card);
                            setState(() {
                              card.isFavorite = true;
                              card.id = savedId;
                            });
                            favoriteCards.add(card);
                          } else {
                            if (card.id != null) {
                              await _dbHelper.deleteFlashcard(card.id!);
                            } else {
                              int? dbId = await _dbHelper.getFavoriteId(
                                card.word,
                              );
                              if (dbId != null)
                                await _dbHelper.deleteFlashcard(dbId);
                            }

                            setState(() {
                              card.isFavorite = false;
                              card.id = null;
                            });

                            favoriteCards.removeWhere(
                              (item) => item.word == card.word,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
