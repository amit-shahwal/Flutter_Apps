import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  @override
  IconContent({@required this.iicon, @required this.gen});
  final IconData iicon;
  final String gen;
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iicon,
          color: Colors.white60,
          size: 80,
        ),
        Text(
          gen,
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        //child_care
      ],
    );
  }
}
