import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'resuable_card_content.dart';
import 'calculations.dart';

class ResultPage extends StatefulWidget {
  ResultPage(
      {@required this.interpretation,
      @required this.bmiResult,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String kk = widget.bmiResult;
    String result = widget.resultText;
    String inter = widget.interpretation;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'YOUR RESULT',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$result',
                    style: TextStyle(
                        color: Color(0xFF24D876),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    '$kk',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                  ),
                  Text(
                    '$inter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Color(0xFFEB1555),
              height: 80,
              width: double.infinity,
              child: Center(
                  child: Text(
                'RE-CALCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 30,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
