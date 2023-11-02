import 'PAGES/questions.dart';

class QuestionBank {
  int _questionNumber = 0;
  final List<Questions> _quizHome = [
    Questions(q: " A cheetah is the fastest animal on the planet", a: false),
    Questions(
        q: "Pigs roll in the mud because it helps to keep them cool.", a: true),
    Questions(q: "An octopus has one heart", a: false),
    Questions(q: "  Sloths take two weeks to digest food.", a: true),
    Questions(q: "Bats are blind", a: false),
    Questions(
        q: "Lions are more likely to hunt down a human than a tiger", a: false)
  ];


  String getQuestionText() {
    return _quizHome[_questionNumber].questionText;
  }

  bool getAnswerText() {
    return _quizHome[_questionNumber].answerText;
  }

  void nextQuestion() {
    if (_questionNumber < _quizHome.length - 1) {
      _questionNumber++;
    }
  }
}
