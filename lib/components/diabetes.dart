import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class DiabetesScreen extends StatefulWidget {
  @override
  _DiabetesScreenState createState() => _DiabetesScreenState();
}

class _DiabetesScreenState extends State<DiabetesScreen> {
  final TextEditingController _bloodSugarController = TextEditingController();
  final TextEditingController _gfrRateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<FlSpot> bloodSugarSpots = [];
  List<FlSpot> gfrRateSpots = [];

  void addData() {
    final bloodSugar = double.parse(_bloodSugarController.text);
    final gfrRate = double.parse(_gfrRateController.text);

    // For future once Hajra Integrates it
    // FirebaseFirestore.instance.collection('health_data').add({
    //   'blood_sugar': bloodSugar,
    //   'gfr_rate': gfrRate,
    //   'date': selectedDate,
    // });

    setState(() {
      bloodSugarSpots.add(FlSpot(selectedDate.day.toDouble(), bloodSugar));
      gfrRateSpots.add(FlSpot(selectedDate.day.toDouble(), gfrRate));
    });
  }

  AppBar topBar() {
    return AppBar(
      title: const Text(
        'Diabetes and Kidney Monitoring',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildInputField(
                  _bloodSugarController, 'Blood Sugar Level (mg/dL)'),
              _buildInputField(_gfrRateController, 'GFR Rate (mL/min/1.73 m²)'),
              _buildDateSelector(),
              ElevatedButton(
                onPressed: addData,
                child: Text('Submit Data'),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue),
              ),
              _buildGraphCard(
                title: 'Blood Sugar Level Over Time',
                spots: bloodSugarSpots,
              ),
              _buildGraphCard(
                title: 'GFR Rate Over Time',
                spots: gfrRateSpots,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          fillColor: Colors.lightBlue.shade50,
          filled: true,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildDateSelector() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Select Date',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null && pickedDate != selectedDate) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGraphCard({required String title, required List<FlSpot> spots}) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ); //Card Ends
  }
}
