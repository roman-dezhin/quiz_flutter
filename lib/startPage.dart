import 'package:flutter/material.dart';
import 'package:flutter_quiz/Strings.dart';
import 'package:flutter_quiz/questionsPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key, required this.title}) : super(key: key);

  static const routeName = '/';

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, QuestionsPage.routeName);
          },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 30),
          ),
          child: const Text(Strings.startButtonTitle),
        ),
      ),
    );
  }
}
