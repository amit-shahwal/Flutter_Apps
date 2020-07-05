import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.ceil().toString();
  }

  String getResult() {
    if (_bmi >= 25) return 'OVER-WEIGHT';
    if (_bmi > 18.5)
      return 'NORMAL';
    else
      return 'UNDER-WEIGHT';
  }

  String getInterpretation() {
    if (_bmi >= 25) return 'Try eating less BUDDY 😁';
    if (_bmi > 18.5)
      return 'YOU are perfect, indeed!☺';
    else
      return 'You should eat more! 😜';
  }
}
