import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzer_flutter/Question.dart';
import 'package:quizzer_flutter/quiz_brain.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain brain = QuizBrain();
  List<Icon> scores = [];
  Question? currentQuestion;
  String questionText = '';

  @override
  void initState() {
    super.initState();
    retrieveQuestion();
  }

  void retrieveQuestion() {
    var question = brain.getNextQuestion();
    setState(() {
      currentQuestion = question;
      questionText = question.text;
    });
  }

  void onAnswer(bool answer) {
    bool correct = answer == currentQuestion?.answer;
    setState(() {
      scores.add(Icon(
        correct ? Icons.check : Icons.close,
        color: correct ? Colors.green : Colors.red,
      ));
    });
    retrieveQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () => onAnswer(true),
              child: Text('TRUE'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () => onAnswer(false),
              child: Text('FALSE'),
            ),
          ),
        ),
        Row(children: scores)
      ],
    );
  }
}
