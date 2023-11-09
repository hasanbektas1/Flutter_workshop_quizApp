import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.resultQuizList, {Key? key}) : super(key: key);

  final List<Map<String, String>> resultQuizList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 213, 253),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 106, 251),
        title: const Text("Questions And Answers List "),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: resultQuizList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              color: const Color.fromARGB(255, 144, 106, 251),
              child: ListTile(
                title: Text(
                  'Question: ${resultQuizList[index].keys.toString().replaceAll(RegExp(r'^\('), '').replaceAll(RegExp(r'\)$'), '')} ',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  'Answer: ${resultQuizList[index].values.toString().replaceAll(RegExp(r'^\('), '').replaceAll(RegExp(r'\)$'), '')} ',
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 199, 33, 21)),
                ),
              ),
            );
          }),
    );
  }
}
