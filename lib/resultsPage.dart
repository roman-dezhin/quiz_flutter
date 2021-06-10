import 'package:flutter/material.dart';
import 'package:flutter_quiz/Strings.dart';
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
          title: Text(Strings.resultsPageTitle),
        ),
        body: Center(
          child: Column(
              children: [
                Text(Strings.totalQuestions + args.totalQuestions.toString()),
                Text(Strings.rightAnswers + args.rightAnswers.toString()),
                Text(Strings.percents + args.percents.toString()),
                ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, StartPage.routeName);
                    },
                    child: Text(Strings.tryAgainButtonTitle)),
              ],
            ),
        ),
    );
  }
}
