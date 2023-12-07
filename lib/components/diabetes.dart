import 'package:flutter/material.dart';

class DiabetesScreen extends StatefulWidget {
  @override
  _DiabetesScreenState createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  double bloodSugarLevel = 100.0;
  double gfrRate = 90.0;

  void updateBloodSugarLevel(double newLevel) {
    setState(() {
      bloodSugarLevel = newLevel;
    });
  }

  void updateGFRRate(double newRate) {
    setState(() {
      gfrRate = newRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes and Kidney Monitoring'),
      ),
    );
  }
}
