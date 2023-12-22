// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fyp/components/addReports.dart';
import 'components/dashboard.dart';
import 'components/reportsDetails.dart';
import 'components/viewReports.dart';
import 'components/diabetes.dart';
import 'components/bloodpressure.dart';
import 'components/LoginSignup/LandingScreen.dart';
import 'components/dietPlan.dart';

void main() => runApp(MaterialApp(
      routes: {
        // home: (),
        '/': (context) => Dashboard(),

        // '/': (context) => DietPlan(),
        '/viewReports': (context) => ViewReportScreen(),
        '/diabetes': (context) => DiabetesScreen(),
        '/addReports': (context) => AddReportScreen(),
        '/reportsDetails': (context) => ReportsDetails(),
        '/bloodpressure': (context) => BloodPressure(),
        // 'landingScreen': (context) => LandingScreen(),
        // Add other routes as needed
      },
    ));
