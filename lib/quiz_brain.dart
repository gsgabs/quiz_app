import 'package:quiz_app/question.dart';

class QuizBrain {

  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question('Aproximadamente um quarto dos ossos humanos estão no pé', false),
    Question('O planeta terra tem 12.756km de diâmetro', true),
    Question('1kg de ouro vale aproximadamente R\$ 600.000 hoje.', true),
  ];

  void nextQuestion() {
    if (_questionIndex >= _questionBank.length) {
      _questionIndex++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

}