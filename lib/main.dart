import 'package:flutter/material.dart';
import 'package:flutter_quiz/questionsPage.dart';
import 'package:flutter_quiz/resultsPage.dart';
import 'package:flutter_quiz/startPage.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => StartPage(title: 'Quiz'),
        QuestionsPage.routeName: (BuildContext context) => QuestionsPage(),
        ResultsPage.routeName: (BuildContext context) => ResultsPage(),
      },
    );
  }
}
