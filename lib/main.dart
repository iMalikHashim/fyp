import 'package:fyp/components/dietRecommendations.dart';
import 'package:fyp/components/splash_screen.dart';

import 'components/Appointments/requestAppointment.dart';
import 'components/doctorsList.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fyp/components/addReports.dart';
import 'package:fyp/firebase_options.dart';
import 'components/dashboard.dart';
import 'components/reportsDetails.dart';
import 'components/viewReports.dart';
import 'components/diabetes.dart';
import 'components/bloodpressure.dart';
import 'components/LoginSignup/LandingScreen.dart';
import 'components/dietPlan.dart';
import 'components/excerciseScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyCnNhUx2Hhu7-YhTLSCdHk7RqZKK4MBXT4',
        authDomain: 'fypckd.firebaseapp.com',
        appId: '1:372513038054:android:eed0d9fdb9a34bf7e5e527',
        messagingSenderId: '372513038054',
        projectId: 'fypckd',
        storageBucket: 'fypckd.appspot.com',
      ),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Set the splash screen as the home screen
      routes: {
        // Define your other routes here
        '/dashboard': (context) => const Dashboard(),
        '/landingPage': (context) => LandingScreen(),
        '/viewReports': (context) => ViewReportScreen(),
        '/diabetes': (context) => DiabetesScreen(),
        '/addReports': (context) => const AddReportScreen(),
        '/reportsDetails': (context) => const ReportsDetails(),
        '/bloodpressure': (context) => const BloodPressure(),
        '/exercise': (context) => ExerciseScreen(),
        '/dietRecommendation': (context) => DietRecommendations(),
      },
      theme: ThemeData(
        // Your theme data
        primarySwatch: const MaterialColor(0xFF08979D, {
          50: Color(0xFFE6F5F6),
          100: Color(0xFFB3E2E7),
          200: Color(0xFF80CFD8),
          300: Color(0xFF4DBBD9),
          400: Color(0xFF1AA8CA),
          500: Color(0xFF08979D),
          600: Color(0xFF067C86),
          700: Color(0xFF04516F),
          800: Color(0xFF023757),
          900: Color(0xFF001C40),
        }),
      ),
    );
  }
}
