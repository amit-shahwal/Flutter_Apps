import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
  List<Widget> scorekeeper = [];

  List<Question> quesbank = [
    Question('Flowers of a pumpkin plant are non-edible.', false),
    Question('Carrot is the root of a plant which we eat as food.', true),
    Question('Sugar is a plant product.', false),
    Question('The flowers of banana plant are eaten as vegetable', true),
    Question('Games can only be played outdoors.', false),
    Question(
        'Boys and girls should be given equal opportunities to prove their talent',
        true),
    Question('Teams are led by referees', false),
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
    Question('Lions are carnivores', true),
  ];

  int questionnumber = 0;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quesbank[questionnumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctanswer = quesbank[questionnumber].answer;

                setState(() {
                  if (questionnumber < quesbank.length - 1) {
                    questionnumber++;

                    if (correctanswer == true) {
                      score++;
                      scorekeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 15,
                        ),
                      );
                    } else {
                      //score--;
                      scorekeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 15,
                        ),
                      );
                    }
                  } else {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc:
                          'You\'ve reached the end of the quiz\n!SCORE:$score/20',
                    ).show();
                    scorekeeper = [];
                    questionnumber = 0;
                    score = 0;
                  }
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                bool correctanswer = quesbank[questionnumber].answer;
                setState(() {
                  if (questionnumber < quesbank.length - 1) {
                    questionnumber++;

                    if (correctanswer == false) {
                      score++;
                      scorekeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 15,
                        ),
                      );
                    } else {
                      // score--;
                      scorekeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 15,
                        ),
                      );
                    }
                  } else {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc:
                          'You\'ve reached the end of the quiz\n!SCORE:$score/20',
                    ).show();
                    questionnumber = 0;
                    score = 0;
                    scorekeeper = [];
                  }
                });
                //The
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: scorekeeper,
          ),
        ),
      ],
    );
  }
}
