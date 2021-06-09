class QuestionModel {
 final String questionText;
 final List<Answer> answers;
 final int correctAnswerIndex;

 QuestionModel({
  required this.questionText,
  required this.answers,
  required this.correctAnswerIndex,
 });

 factory QuestionModel.fromJson(dynamic json) {
  List<Answer> answersList = [];
  if (json['answers'] != null) {
   var answerObjsJson = json['answers'] as List;
   answersList = answerObjsJson.map((answerJson) => Answer.fromJson(answerJson)).toList();
  }

  return QuestionModel(
   questionText: json['questionText'] as String,
   answers: answersList,
   correctAnswerIndex: json['correctAnswerIndex'] as int,
  );
 }
}

class Answer {
 final String text;

 Answer({required this.text});

 factory Answer.fromJson(dynamic json) {
  return Answer(
   text: json['answerText'] as String,
  );
 }
}