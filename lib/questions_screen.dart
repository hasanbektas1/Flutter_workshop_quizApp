import 'package:flutter/material.dart';
import 'package:flutter_workshop_quizapp/data/questions.dart';
import 'package:flutter_workshop_quizapp/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  int correctAnswerCount = 0;
  int wrongAnswerCount = 0;

  void changeQuestion(String selectedAnswer) {
    setState(() {
      if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
        correctAnswerCount++;
      } else {
        wrongAnswerCount++;
      }

      currentQuestionIndex++;
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
                Text(currentQuestion.question),
                ...currentQuestion.answers.map((answer) {
                  return ElevatedButton(
                    onPressed: () {
                      if (questions.length - 1 > currentQuestionIndex) {
                        changeQuestion(answer);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(
                                      correctAnswers: correctAnswerCount,
                                      wrongAnswers: wrongAnswerCount,
                                    )));
                      }
                    },
                    child: Text(answer),
                  );
                })
              ],
            ),
          )
        ]),
      ),
    );
  }
}
