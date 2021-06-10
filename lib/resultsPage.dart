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
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(Strings.totalQuestions + args.totalQuestions.toString(), style: TextStyle(fontSize: 20),),
                Text(Strings.rightAnswers + args.rightAnswers.toString(), style: TextStyle(fontSize: 20),),
                Text(Strings.percents + args.percents.toString(), style: TextStyle(fontSize: 20),),
                ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, StartPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text(Strings.tryAgainButtonTitle)),
              ],
            ),
          ),
        ),
    );
  }
}
