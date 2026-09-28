import 'package:flutter/material.dart';
import 'dart:math';

import 'package:letter_quest/model/flashcard.dart';
import 'package:letter_quest/model/flashcard_data.dart';

class FourPicsGame extends StatefulWidget {
  const FourPicsGame({super.key});

  @override
  State<FourPicsGame> createState() => _FourPicsGameState();
}

class _FourPicsGameState extends State<FourPicsGame> {
  final Random _random = Random();

  late String _targetLetter;
  late List<Flashcard> _choiceCards;
  late int _correctIndex;
  int? _selectedIndex;
  bool _answered = false;

  int _score = 0;
  int _currentRound = 0;
  final int _totalRounds = 10;
  bool _gameFinished = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _score = 0;
      _currentRound = 0;
      _gameFinished = false;
      _generateNewRound();
    });
  }

  void _generateNewRound() {
    setState(() {
      _currentRound++;
      _answered = false;
      _selectedIndex = null;

      List<String> allLetters = flashcardData.keys.toList();
      _targetLetter = allLetters[_random.nextInt(allLetters.length)];

      List<Flashcard> correctLetterCards = List.from(
        flashcardData[_targetLetter]!,
      );
      Flashcard correctCard =
          correctLetterCards[_random.nextInt(correctLetterCards.length)];

      List<Flashcard> distractors = [];
      List<String> otherLetters = allLetters
          .where((l) => l != _targetLetter)
          .toList();

      while (distractors.length < 3) {
        String randomLetter =
            otherLetters[_random.nextInt(otherLetters.length)];
        List<Flashcard> possibleDistractors = flashcardData[randomLetter]!;
        Flashcard distractor =
            possibleDistractors[_random.nextInt(possibleDistractors.length)];

        if (!distractors.any((d) => d.word == distractor.word)) {
          distractors.add(distractor);
        }
      }

      _choiceCards = [correctCard, ...distractors];
      _choiceCards.shuffle();

      _correctIndex = _choiceCards.indexOf(correctCard);
    });
  }

  void _checkAnswer(int index) {
    if (_answered) return;

    setState(() {
      _selectedIndex = index;
      _answered = true;
      if (index == _correctIndex) {
        _score++;
      }

      if (_currentRound >= _totalRounds) {
        _gameFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("4-Pics-1-Letter Game"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: _gameFinished ? _buildSummaryScreen() : _buildGameScreen(),
    );
  }

  Widget _buildGameScreen() {
    return Column(
      children: [
        const SizedBox(height: 15),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(
              "Round: $_currentRound/$_totalRounds",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),
        const Text(
          "Which one starts with...",
          style: TextStyle(fontSize: 22, color: Colors.black54),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.orange, width: 2),
          ),
          child: Text(
            _targetLetter,
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                bool isSelected = _selectedIndex == index;
                bool isCorrect = _correctIndex == index;

                Color borderColor = Colors.transparent;
                if (_answered) {
                  if (isCorrect)
                    borderColor = Colors.green;
                  else if (isSelected)
                    borderColor = Colors.red;
                }

                return GestureDetector(
                  onTap: () => _checkAnswer(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: borderColor, width: 5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            _choiceCards[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                        if (_answered && isCorrect)
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            ),
                          ),
                        if (_answered && isSelected && !isCorrect)
                          const Positioned(
                            top: 0,
                            right: 0,
                            child: Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        if (_answered)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _selectedIndex == _correctIndex
                        ? "Great Job! That's the ${_choiceCards[_correctIndex].word}!"
                        : "Oops! Look for the ${_targetLetter}...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _selectedIndex == _correctIndex
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _gameFinished ? null : _generateNewRound,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "NEXT",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        else
          const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildSummaryScreen() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.stars_rounded, size: 140, color: Colors.orange),
            const SizedBox(height: 20),
            const Text(
              "Awesome Playing!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "You got $_score out of $_totalRounds correct!",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 50),

            ElevatedButton.icon(
              onPressed: _startNewGame,
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.white,
                size: 28,
              ),
              label: const Text(
                "PLAY AGAIN",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
            const SizedBox(height: 20),

            OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.home_rounded,
                color: Colors.orange,
                size: 28,
              ),
              label: const Text(
                "GO HOME",
                style: TextStyle(fontSize: 22, color: Colors.orange),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.orange, width: 2),
                minimumSize: const Size(double.infinity, 65),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
