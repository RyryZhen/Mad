import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screens.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'QuizApp Wizard',
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/quiz.jpg'),
            SizedBox(height: 20),
            Text(
              'Welcome to QuizApp Wizard!',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 39),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => QuestionsScreens()));
              },
              child: Text('Start Quiz', style: TextStyle(fontSize: 28)),
            ),
          ],
        ),
      ),
    );
  }
}
