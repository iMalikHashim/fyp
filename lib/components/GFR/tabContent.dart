import 'dart:math';

import 'package:flutter/material.dart';

class Tab1Content extends StatefulWidget {
  @override
  _Tab1ContentState createState() => _Tab1ContentState();
}

class _Tab1ContentState extends State<Tab1Content> {
  String gender = 'Male'; // Default gender
  TextEditingController scrController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  double eGFR = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: scrController,
            decoration: InputDecoration(
              labelText: 'SERUM CREATININE',
              border: OutlineInputBorder(),
              hintText: 'Enter SERUM CREATININE in mg/dl ',
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'Age',
              border: OutlineInputBorder(),
              hintText: 'Enter age in years',
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Gender:',
                style: TextStyle(fontSize: 16),
              ),
              Radio(
                value: 'Male',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text('Male'),
              Radio(
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text('Female'),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              calculateEGFR();
            },
            child: Text('Calculate eGFR'),
          ),
          SizedBox(height: 20),
          Text('eGFR: $eGFR'),
        ],
      ),
    );
  }

  void calculateEGFR() {
    double scr = double.tryParse(scrController.text) ?? 0.0;
    int age = int.tryParse(ageController.text) ?? 0;

    double beta = (gender == 'Female') ? 0.742 : 1;

    double k = -0.203;
    double alpha = -1.154;

    double result = 175.0 * pow(scr, alpha) * pow(age, k) * beta;

    setState(() {
      eGFR = double.parse(result.toStringAsFixed(2));
    });
  }
}

class Tab2Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'GFR (mL/min/1.73 m2) = 175 × (Scr)-1.154 × (Age)-0.203 × (0.742 if female)'),
    );
  }
}

class Tab3Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Content for Tab 3'),
    );
  }
}

class Tab4Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Content for Tab 4'),
    );
  }
}
