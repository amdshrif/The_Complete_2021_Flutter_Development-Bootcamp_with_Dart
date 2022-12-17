import 'package:flutter/material.dart';
import 'package:quizzler_flutter/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];

  Future<String?> _showDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.grey.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: Colors.grey.shade600,
          ),
        ),
        title: const Center(child: Text('Out of Questions')),
        content: const Text(
            'There are no more questions, please reset to start again.'),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  quizBrain.resetQuestionNumber();
                  scoreKeeper.clear();
                  Navigator.pop(context, 'Reset');
                });
              },
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _checkAnswer(BuildContext context) {
    setState(() {
      if (quizBrain.currentQuestionNumber < quizBrain.questionBanklength - 1) {
        if (quizBrain.getQuestionAnswer() == true) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      } else {
        _showDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                _checkAnswer(context);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                _checkAnswer(context);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.yellow,
              ),
              child: const Text(
                'Rest',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  quizBrain.resetQuestionNumber();
                  scoreKeeper.clear();
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
