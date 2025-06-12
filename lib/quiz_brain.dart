import 'package:quiz_app/question.dart';

class QuizBrain {

  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question('Aproximadamente um quarto dos ossos humanos estão no pé', false),
    Question('O planeta terra tem 12.756km de diâmetro', true),
    Question('1kg de ouro vale aproximadamente R\$ 600.000 hoje.', true),
    Question('A água ferve a 90 graus Celsius ao nível do mar.', false),
    Question('A Grande Muralha da China pode ser vista do espaço a olho nu.', false),
    Question('O sangue humano é sempre vermelho, mesmo dentro do corpo.', true),
    Question('O Monte Everest é a montanha mais alta do mundo acima do nível do mar.', true),
    Question('O cérebro humano consome cerca de 20% da energia do corpo.', true),
    Question('Morango é uma fruta do ponto de vista botânico.', false),
  ];


  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
    else {
      print('Você chegou ao final do quiz.');
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

}