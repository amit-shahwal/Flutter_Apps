import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftpress = 1;
  int rpress = 1;
  int score1;
  int st = 1;
  int t1 = 0;
  int t2 = 0;
  int c1 = 0;
  int c2 = 0;
  int score2;
  var WINNER = 'GAME NOT ENDED';
  @override
  Widget build(BuildContext context) {
    void lpress() {
      setState(() {
        if (c2 == c1) {
          leftpress = Random().nextInt(6) + 1;
          score1 = leftpress;
          t1 = t1 + score1;
          c1 = c1 + 1;
        }
        if (t1 >= 100) {
          WINNER = "PLAYER1";
          leftpress = rpress = 0;
        }
      });
    }

    void rpresss() {
      setState(() {
        if (c2 != c1) {
          rpress = Random().nextInt(6) + 1;
          score2 = rpress;
          t2 = t2 + score2;
          c2 = c2 + 1;
        }
        if (t2 >= 100) {
          WINNER = "PLAYER2";
          leftpress = rpress = 0;
        }
      });
    }

    void refresh() {
      setState(() {
        leftpress = rpress = 1;
        c1 = c2 = 0;
        t1 = 0;
        t2 = 0;
        WINNER = 'GAME NOT ENDED';
      });
    }

    void stop() {
      setState(() {
        st++;
        leftpress = rpress = 0;
      });
    }

    void continuest() {
      setState(() {
        if (c1 == 0 && c2 == 0) {
          leftpress = rpress = 1;
        } else {
          leftpress = score1;
          rpress = score2;
        }
      });
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('WELCOME TO DICEE THEORY')),
          backgroundColor: Colors.red[900],
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'PLAYER-1 ',
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 90,
                ),
                Text(
                  'PLAYER-2',
                  style: TextStyle(
                    fontSize: 34,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'POINT 1:-$t1 ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                  //height: 90,
                ),
                Text(
                  'POINT 1:-$t2',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Text(
                      'COUNT1:-$c1',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.greenAccent,
                      ),
                    ),
                    color: Colors.grey[900],
                  ),
                ),
                SizedBox(
                  width: 20,
                  //height: 90,
                ),
                Container(
                  child: Card(
                    child: Text(
                      'COUNT2:-$c2',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.greenAccent,
                      ),
                    ),
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.end,
                //verticalDirection: VerticalDirection.up,
                // mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize:CrossAxisAlignment.stretch ,
                children: <Widget>[
                  FlatButton(
                    color: Colors.pink[900],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.pink[900],
                    onPressed: () {
                      refresh();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        //color: Colors.teal,
                        width: 110,
                        height: 40,
                        child: Center(
                          child: Text(
                            'REFRESH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 20,
                  ),
                  FlatButton(
                    color: Colors.pink[900],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.pink[900],
                    onPressed: () {
                      stop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        //  color: Colors.teal,
                        width: 110,
                        height: 40,
                        child: Center(
                          child: Text(
                            'STOP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,

                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: FlatButton(
                            onPressed: () {
                              lpress();
                            },
                            child: Image.asset('images/dice$leftpress.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: FlatButton(
                            onPressed: () {
                              rpresss();
                            },
                            child: Image.asset('images/dice$rpress.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        width: 310,
                        height: 30,
                        child: Center(
                          child: Text(
                            'WINNER IS :: $WINNER',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: Divider(
                          thickness: 07,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.pink[900],
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.pink[900],
                            onPressed: () {
                              continuest();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                //color: Colors.teal,
                                width: 110,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    'CONTINUE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
