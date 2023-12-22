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
          SizedBox(height: 10),
          Text(
            'eGFR: $eGFR',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
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
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black, // Adjust the color as needed
          ),
          children: [
            TextSpan(
              text: 'GFR (mL/min/1.73 m',
            ),
            TextSpan(
              text: '2',
              style: TextStyle(
                fontSize: 14,
                // baseline: TextBaseline.alphabetic,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ') = 175 × (Scr)',
            ),
            TextSpan(
              text: '-1.154',
              style: TextStyle(
                fontSize: 14,
                // baseline: TextBaseline.alphabetic,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' × (Age)',
            ),
            TextSpan(
              text: '-0.203',
              style: TextStyle(
                fontSize: 14,
                // baseline: TextBaseline.alphabetic,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' × (0.742 if female)',
            ),
          ],
        ),
      ),
    );
  }
}

class Tab3Content extends StatelessWidget {
  final List<String> bulletPoints = [
    "Recommended method for estimating GFR in adults from the National Kidney Foundation.",
    "Designed for use with laboratory creatinine values that are standardized to IDMS.",
    "Estimates GFR from serum creatinine, age, sex, and race.",
    "More accurate than the MDRD Study equation, particularly in people with higher levels of GFR.",
    "The CKD-EPI equation is based on the same four variables as the MDRD Study equation, but uses a 2-slope 'spline' to model the relationship between estimated GFR and serum creatinine, and a different relationship for age, sex, and race.",
    "Some clinical laboratories are still reporting GFR estimates using the MDRD Study equation.",
    "The National Kidney Foundation has recommended that clinical laboratories should begin using the CKD-EPI equation to report estimated GFR.",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (String point in bulletPoints)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 8.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 8.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Tab4Content extends StatelessWidget {
  final List<String> content = [
    "Levey AS, Stevens LA, Schmid CH, et al. A new equation to estimate glomerular filtration rate. Ann Intern Med. May 5 2009; 150(9): 604-612.",
    "Levey AS, Stevens LA. Estimating GFR using the CKD Epidemiology Collaboration (CKD-EPI) creatinine equation: more accurate GFR estimates, lower CKD prevalence estimates, and better risk predictions. Am J Kidney Dis. Apr 2010; 55(4): 622-627.",
    "Matsushita K, Selvin E, Bash LD, Astor BC, Coresh J. Risk implications of the new CKD Epidemiology Collaboration (CKD-EPI) equation compared with the MORD Study equation for estimated GFR: the Atherosclerosis Risk in Communities (ARIC) Study. Am J Kidney Dis. Apr 201O; 55(4): 648-659.",
    "White SL, Polkinghorne KR, Atkins RC, Chadban SJ. Comparison of the prevalence and mortality risk of CKD in Australia using the CKD Epidemiology Collaboration (CKD-EPI) and Modification of Diet in Renal Disease (MORD) Study GFR estimating equations: the AusDiab (Australian Diabetes, Obesity and Lifestyle) Study. Am J Kidney Dis. Apr 2010; 55(4): 660-670.",
    "Becker BN, Vassalotti JA. A software upgrade: CKD testing in 2010. Am J Kidney Dis. Jan 2009; 55(1): 8-10.",
    "Frequently Asked Questions About GFR Estimates. New York: The National Kidney Foundation; 2011.",
    "National Kidney Foundation. KDOQI clinical practice guidelines for chronic kidney disease: evaluation, classification, and stratification. Am J Kidney Dis. Feb 2002; 39 (Suppl 1): S1-266.",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String item in content)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 8.0,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16.0,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
