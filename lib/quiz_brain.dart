import 'package:flutter/material.dart'; 
import 'package:quiz_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// Definindo um tipo para o callback para clareza (opcional, mas bom)
typedef QuizResetCallback = void Function();

class QuizBrain {

  int _questionIndex = 0;
  int _acertos = 0;
  int _erros = 0;

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


  void nextQuestion(BuildContext context, QuizResetCallback onQuizReset) {
    // Add BuildContext here
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    } else {

      Alert(
        context: context, // Use the passed context
        style: AlertStyle(
          backgroundColor: Colors.grey.shade500,

        ),

        title: "Sua Pontuação",
        desc: "Acertos: $_acertos\n Erros: $_erros",

        buttons: [
          DialogButton(
            color: Colors.blue.shade900,
            onPressed: () {
              Navigator.pop(context); // Fecha o alerta
              resetQuizInternal();    // Reseta o estado interno do QuizBrain
              onQuizReset();
            },
            width: 120,
            child: const Text( // Added const for better performance
              "REINICIAR",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
    }
  }

  // Renomeado para evitar confusão com um possível getter chamado resetQuiz
  void resetQuizInternal() {
    _questionIndex = 0;
    _acertos = 0;
    _erros = 0;
  }

  void correctAnswer() {
    _acertos ++;
  }

  void incorrectAnswer() {
    _erros ++;
  }

  // void zerar() {
  //   _questionIndex = 0;
  //   _erros = 0;
  //   _acertos = 0;
  // }


  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }



}