import 'package:flutter/material.dart';
import 'package:fyp/components/LoginSignup/LandingScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay of 2 seconds (adjust as needed)
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the main content of your app
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingScreen()),
      );
    });

    return const Scaffold(
      backgroundColor: Color(0xFF08979D),
      body: Center(
        child: Text(
          'Nephrofit',
          style: TextStyle(
            fontSize: 36.0, // Adjust the font size
            fontWeight: FontWeight.bold, // Make the text bold
            color: Color(0xFF055B5C), // Set your desired text color
            // Add more styling properties as needed
          ),
        ),
      ),
    );
  }
}
