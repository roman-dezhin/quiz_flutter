import 'package:flutter/material.dart';
import 'package:flutter_quiz/resultArguments.dart';
import 'package:flutter_quiz/startPage.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ResultArguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: Center(
          child: Column(
              children: [
                Text('Total questions: ${args.totalQuestions}'),
                Text('Right answers: ${args.rightAnswers}'),
                Text('Percent: ${args.percents}'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, StartPage.routeName);
                    },
                    child: Text('Try again')),
              ],
            ),
        ),
    );
  }
}
