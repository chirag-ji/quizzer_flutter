import 'package:quizzer_flutter/Question.dart';

class QuizBrain {
  List<Question> _questions = [];
  int _current = -1;

  QuizBrain() {
    _initQuestions();
  }

  _initQuestions() {
    _questions = [
      Question(
        text: 'You can lead a cow down stairs but not up stairs.',
        answer: false,
      ),
      Question(
        text: 'Approximately one quarter of human bones are in the feet.',
        answer: true,
      ),
      Question(
        text: 'A slug\'s blood is green.',
        answer: true,
      ),
      Question(
        text: 'Some cats are actually allergic to humans',
        answer: true,
      ),
      Question(
        text: 'Approximately one quarter of human bones are in the feet.',
        answer: true,
      ),
      Question(
        text: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
        answer: true,
      ),
      Question(
        text: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true,
      ),
      Question(
        text:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false,
      ),
      Question(
        text:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true,
      ),
      Question(
        text:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false,
      ),
      Question(
        text:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true,
      ),
      Question(
        text: 'Google was originally called \"Backrub\".',
        answer: true,
      ),
      Question(
        text:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true,
      ),
      Question(
        text:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true,
      ),
    ];
  }

  int _getNextQuestionIdx() {
    if (_current == _questions.length - 1)
      _current = _questions.length - 1;
    else if (_current > _questions.length - 1)
      _current = 0;
    else
      _current += 1;
    return _current;
  }

  Question getQuestion(int idx) {
    return _questions[idx];
  }

  Question getNextQuestion() {
    int idx = _getNextQuestionIdx();
    return getQuestion(idx);
  }

  bool isLastQuestion(int number) {
    return number == _questions.length;
  }

  bool isOnLastQuestion() {
    return isLastQuestion(_current + 1);
  }

  void reset() {
    _current = -1;
  }
}
