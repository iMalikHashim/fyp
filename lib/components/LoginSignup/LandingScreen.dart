// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF08979D), // Set the background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/landingpage.png'),
            const SizedBox(height: 24),

            // Main heading
            const Text(
              'NephroFit',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(244, 248, 243, 243)),
            ),
            const SizedBox(height: 16),

            // Subtitle
            const Text(
              'Tagline? \n Keep a check for your Health',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18, color: Color.fromARGB(244, 252, 246, 246)),
            ),
            const SizedBox(height: 32),

            // Login button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                backgroundColor: Color(0xFF055B5C), // Assuming a green button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 16),

            // Sign up button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                backgroundColor: Color(0xFF08979D), // Assuming a green button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
              ),
              child: const Text('SIGN UP'),
            ),
          ],
        ),
      ),
    );
  }
}
