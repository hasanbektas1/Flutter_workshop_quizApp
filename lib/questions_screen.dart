import 'package:flutter/material.dart';
import 'package:flutter_workshop_quizapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key, required this.onChoseAnswer})
      : super(key: key);

  final void Function(String answer, String questionPar) onChoseAnswer;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void changeQuestion(String answer, String questionsFuncPar) {
    setState(() {
      widget.onChoseAnswer(answer, questionsFuncPar);
      if (questions.length - 1 > currentQuestionIndex) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    currentQuestion.question,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                ...currentQuestion.answers.map((answer) {
                  return ElevatedButton(
                      child: Text(answer),
                      onPressed: () {
                        changeQuestion(answer, currentQuestion.question);
                      });
                })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
