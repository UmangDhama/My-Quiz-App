import 'package:flutter/material.dart';
import 'package:project2/data/questions.dart';
import 'package:project2/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.retryQuiz});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'questions': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': choosenAnswer[i],
        },
      );
    }
    return summary;
  }

  final List<String> choosenAnswer;
  final Function() retryQuiz;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestion questions",
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 186, 129, 199),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummar(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: retryQuiz, child: const Text("Retry Quiz!")),
          ],
        ),
      ),
    );
  }
}
