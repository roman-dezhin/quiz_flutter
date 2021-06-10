import 'package:flutter/material.dart';
import 'package:flutter_quiz/questionsPage.dart';
import 'package:flutter_quiz/resultsPage.dart';
import 'package:flutter_quiz/startPage.dart';
import 'Strings.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder> {
        StartPage.routeName: (BuildContext context) => StartPage(title: Strings.appTitle),
        QuestionsPage.routeName: (BuildContext context) => QuestionsPage(),
        ResultsPage.routeName: (BuildContext context) => ResultsPage(),
      },
    );
  }
}
