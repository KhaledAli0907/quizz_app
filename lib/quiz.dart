import 'package:flutter/material.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/widgets/home_screen.dart';

const Alignment gradientStart = Alignment.topLeft;
const Alignment gradientEnd = Alignment.bottomRight;
const List<Color> grediantColors = [Colors.green, Colors.greenAccent];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget activeScreen;

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = HomeScreen(switchScreen);
  }

  @override
  Widget build(BuildContext context) {
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
          child: activeScreen,
        ),
      ),
    );
  }
}
