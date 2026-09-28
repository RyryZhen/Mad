import 'package:flutter/material.dart';
import 'package:letter_quest/favorites_screen.dart';
import 'package:letter_quest/flashcard_gallery.dart';
import 'package:letter_quest/four_pics_game.dart';
import 'package:letter_quest/model/flashcard.dart';
import 'package:letter_quest/model/flashcard_data.dart';
import 'package:letter_quest/model/letter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Letter> myList = [
    Letter(letter: 'A', color: Colors.red),
    Letter(letter: 'B', color: Colors.amber),
    Letter(letter: 'C', color: Colors.green),
    Letter(letter: 'D', color: Colors.blueAccent),
    Letter(letter: 'E', color: Colors.deepPurpleAccent),

    Letter(letter: 'F', color: Colors.red),
    Letter(letter: 'G', color: Colors.amber),
    Letter(letter: 'H', color: Colors.green),
    Letter(letter: 'I', color: Colors.blueAccent),
    Letter(letter: 'J', color: Colors.deepPurpleAccent),

    Letter(letter: 'K', color: Colors.red),
    Letter(letter: 'L', color: Colors.amber),
    Letter(letter: 'M', color: Colors.green),
    Letter(letter: 'N', color: Colors.blueAccent),
    Letter(letter: 'O', color: Colors.deepPurpleAccent),

    Letter(letter: 'P', color: Colors.red),
    Letter(letter: 'Q', color: Colors.amber),
    Letter(letter: 'R', color: Colors.green),
    Letter(letter: 'S', color: Colors.blueAccent),
    Letter(letter: 'T', color: Colors.deepPurpleAccent),

    Letter(letter: 'U', color: Colors.red),
    Letter(letter: 'V', color: Colors.amber),
    Letter(letter: 'W', color: Colors.green),
    Letter(letter: 'X', color: Colors.blueAccent),
    Letter(letter: 'Y', color: Colors.deepPurpleAccent),

    Letter(letter: 'Z', color: Colors.red),
  ];

  void sortAToZ() {
    setState(() {
      myList.sort((a, b) => a.letter.compareTo(b.letter));
    });
  }

  void sortZToA() {
    setState(() {
      myList.sort((a, b) => b.letter.compareTo(a.letter));
    });
  }

  void shuffleLetters() {
    setState(() {
      myList.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      appBar: AppBar(
        title: const Text(
          'Letter Quest',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>
                showSortMenu(context, sortAToZ, sortZToA, shuffleLetters),
            icon: const Icon(Icons.sort_rounded, size: 35),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritesScreen(),
                ),
              ).then((_) {});
            },
            icon: const Icon(Icons.star_outline_rounded, size: 35),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 72, 72, 73),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FourPicsGame(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "4-Pics Game",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      List<Flashcard> allCards = [];
                      flashcardData.values.forEach(
                        (list) => allCards.addAll(list),
                      );

                      allCards.shuffle();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlashcardGallery(
                            letter: "Shuffle",
                            themeColor: Colors.orange,
                            customCards: allCards,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Shuffle Gallery",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemCount: myList.length,
                itemBuilder: (BuildContext context, int index) {
                  final letterDisplay = myList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlashcardGallery(
                            letter: letterDisplay.letter,
                            themeColor: letterDisplay.color,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: letterDisplay.color,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GridTile(
                        child: Center(
                          child: Text(
                            letterDisplay.letter,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 120,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showSortMenu(
  BuildContext context,
  VoidCallback sortAToZ,
  VoidCallback sortZToA,
  VoidCallback shuffleLetters,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: const Color(0xFFFFF9F0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Sort Letters',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                sortAToZ();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.sort_by_alpha_rounded),
              label: const Text("Sort A to Z", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {
                sortZToA();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.text_rotate_vertical_rounded),
              label: const Text("Sort Z to A", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: () {
                shuffleLetters();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.shuffle_rounded),
              label: const Text(
                "Random Shuffle",
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      );
    },
  );
}
