import 'package:flutter/material.dart';
import 'package:quizup/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const QuizzUp(),
      //   '/quiz_screen': (context) => const QuizScreen(),
      // },
      home: QuizzUp(),
    );
  }
}

class QuizzUp extends StatefulWidget {
  const QuizzUp({super.key});

  @override
  State<QuizzUp> createState() => _QuizzUpState();
}

class _QuizzUpState extends State<QuizzUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const QuizScreen()),
              (Route<dynamic> route) => false,
            );
          },
          child: const Text('Start Quiz'),
        ),
      ),
    );
  }
}
