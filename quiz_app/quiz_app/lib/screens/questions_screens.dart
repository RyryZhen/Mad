import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_list.dart';

class QuestionsScreens extends StatefulWidget {
  const QuestionsScreens({super.key});

  @override
  State<QuestionsScreens> createState() => _QuestionsScreensState();
}

class _QuestionsScreensState extends State<QuestionsScreens> {
  final questionsList = QuestionsList;

  final answerList = AnswersList;

  var questionIndex = 0;
  var score = 0;
  var isFinished = false;

  void checkAnswer(bool answer) {
    score += answer == answerList[questionIndex] ? 1 : 0;

    setState(() {
      questionIndex++;

      if (questionIndex >= questionsList.length) {
        isFinished = true;
        questionIndex = questionsList.length - 1; // optional, just to stay safe
      }
    });
    print(score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back', style: TextStyle(fontSize: 22)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 200),
          child: isFinished ? showScore() : showQuestions(),
        ),
      ),
    );
  }

  Widget showQuestions() {
    return Column(
      children: [
        Text(
          questionsList[questionIndex],
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 50),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text('TRUE'),
              ),
            ),
            SizedBox(width: 50),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () => checkAnswer(false),
                child: Text('FALSE'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget showScore() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '🎉 Congratulations!',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '$score / ${questionsList.length}',
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                questionIndex = 0;
                score = 0;
                isFinished = false;
              });
            },
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
// void checkAnswer(bool answer) {
  //   print('answer $answer');
  //   // if (answer == answerList[questionIndex]) {
  //   //   score++;
  //   //}
  //   score += answer == answerList[questionIndex] ? 1 : 0;
  //   setState(() {
  //     // if (questionIndex < questionsList.length - 1) {
  //     //   questionIndex++;
  //     // }
  //     if (++questionIndex > 2) isFinished = false;
  //   });
  //   print(score);
  // }
