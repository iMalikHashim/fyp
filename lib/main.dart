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
import 'components/dietRecommendations.dart';

void main() => runApp(MaterialApp(
      routes: {
        // home: (),
        '/': (context) => Dashboard(),

        // '/': (context) => DietRecommendations(),
        '/viewReports': (context) => ViewReportScreen(),
        '/diabetes': (context) => DiabetesScreen(),
        '/addReports': (context) => AddReportScreen(),
        '/reportsDetails': (context) => ReportsDetails(),
        '/bloodpressure': (context) => BloodPressure(),
        // 'landingScreen': (context) => LandingScreen(),
        // Add other routes as needed
      },
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF08979D, const {
          50: Color(0xFFE6F5F6),
          100: Color(0xFFB3E2E7),
          200: Color(0xFF80CFD8),
          300: Color(0xFF4DBBD9),
          400: Color(0xFF1AA8CA),
          500: Color(0xFF08979D), // The primary color
          600: Color(0xFF067C86),
          700: Color(0xFF04516F),
          800: Color(0xFF023757),
          900: Color(0xFF001C40),
        }),
      ),
    ));
