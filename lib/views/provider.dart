import 'package:flutter/material.dart';

class BMIProvider extends ChangeNotifier {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double _bmi = 0;
  String _bmiCategory = "";

  double get bmi => _bmi;
  String get bmiCategory => _bmiCategory;
  void calculateBMI() {
    final double height = double.parse(heightController.text) ?? 0;
    final double weight = double.parse(weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      _bmi = weight / (height * height) * 10000;
      if (_bmi < 18.5) {
        _bmiCategory = "Underweight\n(BMI < 18.5)";
      } else if (_bmi >= 18.5 && _bmi < 24.9) {
        _bmiCategory = "Normal Weight\n(18.5 - 24.9)";
      } else if (_bmi >= 25 && _bmi < 30) {
        _bmiCategory = "Overweight\n(BMI 25 - 29.9)";
      } else {
        _bmiCategory = "Obesity\n(BMI 30 or higher)";
      }
    }
    notifyListeners();
  }
}
