import 'package:flutter/material.dart';
import 'package:project2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummar extends StatelessWidget {
  const QuestionSummar(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    decoration: BoxDecoration(
                      color: 'user_answer' == 'correct_answer'
                          ? const Color.fromARGB(
                              158, 246, 69, 4) // Color when condition is met
                          : const Color.fromARGB(95, 111, 218,
                              143), // Color when condition is not met
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 186, 129, 199), // Border color
                        width: 2,
                      ),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 42, 5, 251),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['questions'] as String,
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 186, 129, 199),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 5, 242, 123),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 194, 252, 4),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
