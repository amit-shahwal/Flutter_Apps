import 'package:flutter/material.dart';

//  we will always start with main
//  inside main all starts with MaterialApp

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('I AM RICH'),
            ),
            backgroundColor: Colors.blueGrey[900],
          ),
          backgroundColor: Colors.blueGrey,
          body: Center(
            child: Image(
              image: AssetImage('images/diamond.png'),
            ),
          ),
        ), //this is where all starts
      ),
    );
