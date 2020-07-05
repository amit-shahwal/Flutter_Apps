import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card_content.dart';
import 'calculations.dart';
import 'result_page.dart';

const activecolor = Color(0xFF1D1E33);
const inactivecolor = Color(0xFF111328);
const ktextstyle =
    TextStyle(fontSize: 50, color: Colors.white70, fontWeight: FontWeight.w900);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = inactivecolor;
  Color femalecolor = inactivecolor;
  int height = 180;
  int weight = 40;
  int age = 14;
  void updatecolor(int gender) {
    if (gender == 1 && malecolor == inactivecolor) {
      malecolor = activecolor;
      femalecolor = inactivecolor;
    }
    if (gender == 2 && femalecolor == inactivecolor) {
      femalecolor = activecolor;
      malecolor = inactivecolor;
    }
  }

  void updateweight(int wt) {
    if (wt == 1)
      weight++;
    else
      weight--;
  }

  void updateage(int ag) {
    if (ag == 1)
      age++;
    else
      age--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(1);
                      });
                    },
                    child: ReusableCard(
                      colour: malecolor,
                      cardchild: IconContent(
                        iicon: Icons.child_care,
                        gen: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femalecolor,
                      cardchild: IconContent(
                        iicon: Icons.face,
                        gen: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Color(0xFF1D1E33),
              cardchild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: ktextstyle,
                      ),
                      Text(
                        'CM',
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                        Text(
                          weight.toString(),
                          style: ktextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateweight(1);
                                });
                              },
                              child: Icon(
                                Icons.add_circle,
                                size: 50,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateweight(2);
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                size: 50,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                        Text(
                          age.toString(),
                          style: ktextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateage(1);
                                });
                              },
                              child: Icon(
                                Icons.add_circle,
                                size: 50,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  updateage(2);
                                });
                              },
                              child: Icon(
                                Icons.remove_circle,
                                size: 50,
                                color: Colors.white70,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: Color(0xFFEB1555),
              height: 80,
              width: double.infinity,
              child: Center(
                  child: Text(
                'CALCULATE',
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
