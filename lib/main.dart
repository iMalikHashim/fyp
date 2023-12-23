// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this line
import 'package:fyp/components/addReports.dart';
import 'package:fyp/firebase_options.dart';
import 'components/dashboard.dart';
import 'components/reportsDetails.dart';
import 'components/viewReports.dart';
import 'components/diabetes.dart';
import 'components/bloodpressure.dart';
import 'components/LoginSignup/LandingScreen.dart';
import 'components/dietPlan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    routes: {
      '/': (context) => Dashboard(),
      '/viewReports': (context) => ViewReportScreen(),
      '/diabetes': (context) => DiabetesScreen(),
      '/addReports': (context) => AddReportScreen(),
      '/reportsDetails': (context) => ReportsDetails(),
      '/bloodpressure': (context) => BloodPressure(),
    },
  ));
}
