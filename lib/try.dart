import 'package:flutter/material.dart';

const startAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;
void main() {
  runApp(
    MaterialApp(
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(80),
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 400,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              "Learn Flutter the Fun Way",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle button press
              print('Button pressed!');
            },
            child: const Text('Click Me'),
          )
        ]),
      ),
    )),
  );
}
