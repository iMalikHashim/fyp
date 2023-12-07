import 'package:flutter/material.dart';

class DiabetesScreen extends StatefulWidget {
  @override
  _DiabetesScreenState createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  double bloodSugarLevel = 100.0;
  double gfrRate = 90.0;

  void updateBloodSugarLevel(double newLevel) {
    setState(() {
      bloodSugarLevel = newLevel;
    });
  }

  void updateGFRRate(double newRate) {
    setState(() {
      gfrRate = newRate;
    });
  }

  AppBar topBar() {
    return AppBar(
      title: const Text(
        'Diabetes and Kidney Monitoring',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 30.0,
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('Blood Sugar Level'),
              subtitle: Text('$bloodSugarLevel mg/dL'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('GFR Rate'),
              subtitle: Text('$gfrRate mL/min/1.73 m²'),
            ),
          ),
        ],
      ),
    );
  }
}
