import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'components/dashboard.dart';
import 'components/Reports.dart';
import 'components/diabetes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiabetesScreen(),
    );
  }
}
