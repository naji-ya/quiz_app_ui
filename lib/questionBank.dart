import 'PAGES/questions.dart';

class QuestionBank {
  int _questionNumber = 0;
// list of question and answers
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
//method to get question
  String getQuestionText() {
    return _quizHome[_questionNumber].questionText;
  }
//method for getting answers
  bool getAnswerText() {
    return _quizHome[_questionNumber].answerText;
  }


// method to go to next question
  void nextQuestion() {
    if (_questionNumber < _quizHome.length - 1) {
      _questionNumber++;
    }
  }

// method to find the questions are finished
  bool isFinished() {
    if (_questionNumber == _quizHome.length - 1) {
      return true;
    } else {
      return false;
    }
  }
// method to reset the question
  void reset() {
    _questionNumber = 0;
  }
}
