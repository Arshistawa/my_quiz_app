import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_home.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizHome quizHome = QuizHome();

  List<Icon> scoreKeeper = [];
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
                quizHome.getQuestion(),
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
            child: InkWell(
              onTap: () {
                //The user picked true.
                if (quizHome.getAnswer() == true) {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }

                setState(() {
                  quizHome.nextQuestion();
                });
              },
              child: Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                //The user picked false.
                if (quizHome.getAnswer() == false) {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }

                setState(() {
                  quizHome.nextQuestion();
                });
              },
              child: Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
/*
  if (answers[questionNnumber] == true) {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
  if (answers[questionNnumber] == false) {
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                } else {
                  scoreKeeper.add(const Icon(
                    Icons.check,
                    color: Colors.green,
                  ));
                }
  */

