import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  @override
  ReusableCard({@required this.colour, this.cardchild});
  final Color colour;
  final Widget cardchild;
  Widget build(BuildContext context) {
    return Container(
      //color: Color(0xFF1D1E33),
      child: cardchild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
