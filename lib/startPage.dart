import 'package:flutter/material.dart';
import 'package:flutter_quiz/questionsPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, QuestionsPage.routeName);
          },
          child: const Text('Start'),
        ),
      ),
    );
  }
}
