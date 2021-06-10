import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/resultArguments.dart';
import 'package:flutter_quiz/resultsPage.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  static const routeName = '/questions';

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<QuestionModel> _questions = [];
  int _currentQuestionIndex = 0;
  int _totalQuestions = 0;
  int _rightAnswersCount = 0;
  bool _isAnswerButtonEnabled = true;
  final _defaultColor = Colors.blue;
  bool _isAnswered = false;
  int _answerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: _questions.isNotEmpty
          ? Column(
            children: [
              Text(_questions[_currentQuestionIndex].questionText),
              Divider(),
              answerButton(0),
              answerButton(1),
              answerButton(2),
              answerButton(3),
              if (_isAnswered) nextButton(),
            ])
          : Container(),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
        onPressed: () {
          // check if exists the next question
          if (_currentQuestionIndex + 1 < _totalQuestions) {
            setState(() {
              _isAnswered = false;
              _answerIndex = -1;
              _isAnswerButtonEnabled = true;
              _currentQuestionIndex++;
            });
          } else
            // if it's the last question, go to the result page
            if (_currentQuestionIndex + 1 == _totalQuestions) {
            final percents = _rightAnswersCount / _totalQuestions * 100;
            Navigator.popAndPushNamed(
                context,
                ResultsPage.routeName,
                arguments: ResultArguments(
                  _totalQuestions,
                  _rightAnswersCount,
                  percents.round(),
                ));
          }
        },
        child: Text('Next'));
  }

  Widget answerButton(int index) {
    QuestionModel question = _questions[_currentQuestionIndex];
    return ElevatedButton(
      onPressed: _isAnswerButtonEnabled
          ? () {
              setState(() {
              _isAnswerButtonEnabled = false;
              _answerIndex = index;
              _isAnswered = true;
              if (index == question.correctAnswerIndex) {
                _rightAnswersCount++;
              }
            });
          }
        : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return Theme.of(context)
                  .colorScheme
                  .primary;
            else if (states.contains(MaterialState.disabled))
              return _getAnswerButtonColor(index);
            return _defaultColor; // Use the component's default.
          },
        ),
      ),
      child: Text(question.answers[index].text),
    );
  }

  Color _getAnswerButtonColor(int buttonIndex) {
    Color color = _defaultColor;
    // if we didn't press this button
    if (buttonIndex != _answerIndex) return color;
    // if we pressed this button
    if (buttonIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }
    return color;
  }

  @override
  void initState() {
    super.initState();
    _fetchQuestions().then((value) {
      setState(() {
        _questions = value;
        _totalQuestions = value.length;
      });
    });
  }
}

Future<List<QuestionModel>> _fetchQuestions() async {
  final textQuestions = await rootBundle.loadString('assets/questions.json');
  return compute(_parseQuestion, textQuestions);
}

List<QuestionModel> _parseQuestion(String text) {
  List<QuestionModel> list = [];
  final parsed = jsonDecode(text)['questions'];
  if (parsed != null) {
     var questionObjsJson = parsed as List;
     list = questionObjsJson.map((json) => QuestionModel.fromJson(json)).toList();
  }
  return list;
}
