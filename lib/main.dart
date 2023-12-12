// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fyp/components/addReports.dart';
import 'components/dashboard.dart';
import 'components/reportsDetails.dart';
import 'components/viewReports.dart';
import 'components/diabetes.dart';

void main() => runApp(MaterialApp(
      routes: {
        // home: (),
        '/': (context) => Dashboard(),
        '/viewReports': (context) => ViewReportScreen(),
        '/diabetes': (context) => DiabetesScreen(),
        '/addReports': (context) => AddReportScreen(),
        '/reportsDetails': (context) => ReportsDetails(),
        // Add other routes as needed
      },
    ));
