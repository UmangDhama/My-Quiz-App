import 'package:flutter/material.dart';
import 'package:project2/question_screen.dart';
import "package:project2/start_screen.dart";
import 'package:project2/data/questions.dart';
import 'package:project2/result_screen.dart';

const startAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = "Start_Screen";

  void switchScreen() {
    setState(() {
      activeScreen = "Question_Screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result_Screen"; // Fixed the typo here
      });
    }
  }

  void retryQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = "Question_Screen"; //Fixed the typo here
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == "Question_Screen") {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == "result_Screen") {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswer,
        retryQuiz: retryQuiz,
      ); // Corrected class instantiation
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 38, 1, 44),
                Color.fromARGB(255, 60, 4, 70)
              ],
              begin: startAlignment,
              end: endAlignment,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
