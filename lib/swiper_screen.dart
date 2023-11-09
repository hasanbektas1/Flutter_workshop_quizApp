import 'package:flutter/material.dart';
import 'package:flutter_workshop_quizapp/data/questions.dart';
import 'package:flutter_workshop_quizapp/questions_screen.dart';
import 'package:flutter_workshop_quizapp/result_screen.dart';
import 'package:flutter_workshop_quizapp/start_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  var _activeScreenName = "start-screen";
  // key,value => {"soru":"cevvap","soru2":"cevap2"}
  List<Map<String, String>> questionsAndAnswers = [];

  void changeScreen() {
    setState(() {
      _activeScreenName = "quiz-screen";
    });
  }

  void choseAnswer(String answer, String questionsSwipPar) {
    setState(() {
      Map<String, String> mapList = {questionsSwipPar: answer};
      questionsAndAnswers.add(mapList);

      if (questionsAndAnswers.length > questions.length - 1) {
        _activeScreenName = "result-screen";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StarScreen(changeScreen);
    print("widgett");

    if (_activeScreenName == "quiz-screen") {
      activeScreen = QuestionScreen(
        onChoseAnswer: (answer, questionPA) => choseAnswer(answer, questionPA),
      );
    }
    if (_activeScreenName == "result-screen") {
      activeScreen = ResultScreen(questionsAndAnswers);
    }
    return Container(child: activeScreen);
  }
}
