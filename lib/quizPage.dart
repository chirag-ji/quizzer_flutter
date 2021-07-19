import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzer_flutter/Question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  List<Icon> scores = [];
  int currentQue = 0;

  @override
  void initState() {
    super.initState();
    questions = [
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
    ];
  }

  int getNextQuestionNumber(int current) {
    if (current == questions.length - 1)
      return questions.length - 1;
    else if (current > questions.length - 1)
      return current;
    else
      return current + 1;
  }

  void addAnswer(int num, bool correct) {
    int nextQue = getNextQuestionNumber(num);
    setState(() {
      scores.add(Icon(
        correct ? Icons.check : Icons.close,
        color: correct ? Colors.green : Colors.red,
      ));
      currentQue = nextQue;
    });
  }

  void onAnswer(int num, bool answer) {
    addAnswer(num, answer == questions[num].answer);
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
                questions[currentQue].text,
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
              onPressed: () => onAnswer(currentQue, true),
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
              onPressed: () => onAnswer(currentQue, false),
              child: Text('FALSE'),
            ),
          ),
        ),
        Row(children: scores)
      ],
    );
  }
}
