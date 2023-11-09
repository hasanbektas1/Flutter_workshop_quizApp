import 'package:flutter/material.dart';

class StarScreen extends StatelessWidget {
  const StarScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "images/quizapp.png",
              width: 250,
            ),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {
                startQuiz();
              },
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
            ),
          ],
        ),
      ),
    );
  }
}
