import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:project2/answer_button.dart';
import 'package:project2/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuesIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuesIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuesIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 186, 129, 199),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  });
            }),
          ],
        ),
      ),
    );
  }
}
