import 'package:flutter/material.dart';
import 'package:flutter_workshop_quizapp/data/questions.dart';

void main() {
  runApp(const MaterialApp(home: QuestionsScreen()));
}

class StarScreen extends StatelessWidget {
  const StarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Metallica.jpg",
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
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(14, 20, 14, 20)),
            ),
          ],
        ),
      ),
    );
  }
}

// Boilerplate
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionsScreen> {
  int indexNo = 0;
  var questionsList = questions;

  void changeQuestion() {
    setState(() {
      indexNo == 4 ? indexNo = 0 : indexNo++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            questionsList[indexNo].question,
            style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          ...questionsList[indexNo].answers.map((listeDegeri) {
            return ElevatedButton(
              onPressed: () {
                changeQuestion();
              },
              child: Text(
                listeDegeri,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            );
          })
        ]),
      ),
    );
  }
}
