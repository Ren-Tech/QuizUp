import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'alert_dialog.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreKeeper = [];

  int score = 0;

  void checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (quizBrain.isFinished() == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              //this is to pass the value of score from this file to another file. It serves like a bridge
              scoreValue: score,
            );
          },
        );

        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        //this check the answer first before going setState and adding up the questioNumber
        bool correctAnswer = quizBrain.getQuestionAnswer();

        if (userPickedAnswer == correctAnswer) {
          score++;
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(Icons.close, color: Colors.red),
          );
        }

        quizBrain.nextQuestion();
      }
    });
  }

  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizBrain.getQuestion(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 193, 192, 192),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    //the user pressed true
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(true);
                      },
                      child: const Text('TRUE'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        checkAnswer(false);
                      },
                      child: const Text('FALSE'),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Row(
                  children: scoreKeeper,
                ),
              )
            ],
          ),
        ));
  }
}
