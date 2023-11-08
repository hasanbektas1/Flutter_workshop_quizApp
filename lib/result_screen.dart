import 'package:flutter/material.dart';
import 'package:flutter_workshop_quizapp/questions_screen.dart';

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  const ResultScreen(
      {Key? key, required this.correctAnswers, required this.wrongAnswers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              color: const Color.fromARGB(255, 99, 54, 224),
              child: Column(
                children: [
                  const Divider(
                    height: 10, // Boşluk bırakmak
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      "images/result_quiz.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const Divider(
                    height: 10, // Boşluk bırakmak
                  ),
                  ListTile(
                    title: Text(
                      "Dogru Cevap : $correctAnswers",
                      style: const TextStyle(fontSize: 20),
                    ),
                    tileColor: Colors.green,
                    trailing: const Icon(Icons.check),
                  ),
                  const Divider(
                    height: 10, // Boşluk bırakmak
                  ),
                  ListTile(
                    title: Text(
                      "Yanlis Cevap : $wrongAnswers",
                      style: const TextStyle(fontSize: 20),
                    ),
                    tileColor: Colors.red,
                    trailing: Icon(Icons.close),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionScreen()));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 147, 98, 233),
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 56)),
                      child: const Text(
                        'Try Again',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
