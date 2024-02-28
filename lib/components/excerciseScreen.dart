import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  TextEditingController bpController = TextEditingController();
  TextEditingController sgController = TextEditingController();
  TextEditingController alController = TextEditingController();
  TextEditingController suController = TextEditingController();
  TextEditingController rbcController = TextEditingController();
  TextEditingController buController = TextEditingController();
  TextEditingController scController = TextEditingController();
  TextEditingController sodController = TextEditingController();
  TextEditingController potController = TextEditingController();
  TextEditingController hemoController = TextEditingController();
  TextEditingController wbccController = TextEditingController();
  TextEditingController rbccController = TextEditingController();

  String exerciseRecommendation = "";

  // Function to generate exercise recommendation based on attributes
  void generateRecommendation(
      double bp,
      double sg,
      double al,
      double su,
      double rbc,
      double bu,
      double sc,
      double sod,
      double pot,
      double hemo,
      double wbcc,
      double rbcc) {
    // Example logic for exercise recommendation based on attributes
    if (bp > 140 || su > 1.0 || hemo < 12.0) {
      setState(() {
        exerciseRecommendation =
            "Based on your attributes, it's recommended to consult with a healthcare professional before starting any exercise program.";
      });
    } else if (sg > 1.015 && al < 0.2) {
      setState(() {
        exerciseRecommendation =
            "You can engage in light to moderate-intensity exercises such as walking, swimming, or cycling.";
      });
    } else {
      setState(() {
        exerciseRecommendation =
            "Consult with a healthcare professional for personalized exercise recommendations based on your specific kidney condition.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kidney Health Exercise Recommendations',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter Your Kidney Attributes',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              // Input fields for kidney attributes
              TextFormField(
                controller: bpController,
                decoration: InputDecoration(labelText: 'Blood Pressure (BP)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: sgController,
                decoration: InputDecoration(labelText: 'Specific Gravity (SG)'),
                keyboardType: TextInputType.number,
              ),
              // Other input fields for attributes
              // ...
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Parse input values and generate exercise recommendation
                  double bp = double.parse(bpController.text);
                  double sg = double.parse(sgController.text);
                  double al = double.parse(alController.text);
                  double su = double.parse(suController.text);
                  double rbc = double.parse(rbcController.text);
                  double bu = double.parse(buController.text);
                  double sc = double.parse(scController.text);
                  double sod = double.parse(sodController.text);
                  double pot = double.parse(potController.text);
                  double hemo = double.parse(hemoController.text);
                  double wbcc = double.parse(wbccController.text);
                  double rbcc = double.parse(rbccController.text);

                  generateRecommendation(
                      bp, sg, al, su, rbc, bu, sc, sod, pot, hemo, wbcc, rbcc);
                },
                child: Text('Generate Recommendation'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
              ),
              SizedBox(height: 20.0),
              Text(
                'Exercise Recommendation:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                exerciseRecommendation,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
