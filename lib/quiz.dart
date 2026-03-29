import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/widgets/home_screen.dart';
import 'package:quizz_app/results_screen.dart';

const Alignment gradientStart = Alignment.topLeft;
const Alignment gradientEnd = Alignment.bottomRight;
const List<Color> grediantColors = [Colors.green, Colors.greenAccent];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'home-screen';

  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activeScreen = 'home-screen';
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = switch (activeScreen) {
      'home-screen' => HomeScreen(switchScreen),
      'questions-screen' => QuestionsScreen(onSelectAnswer: chooseAnswer),
      'results-screen' => ResultsScreen(chosenAnswers: selectedAnswers),
      _ => HomeScreen(switchScreen),
    };

    return MaterialApp(
      title: 'Quizz App',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: grediantColors,
              begin: gradientStart,
              end: gradientEnd,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
