import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CKDGraphsPage(),
    );
  }
}

class CKDGraphsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CKD Risk Monitoring')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGraphCard(
              title: 'Blood Pressure',
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 80,
                  minY: 0,
                  maxY: 80,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(10, 20),
                        FlSpot(20, 30),
                        // Add more spots for data points
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            _buildGraphCard(
              title: 'Sugar Level',
              child: BarChart(
                BarChartData(
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 10,
                      barRods: [
                        BarChartRodData(
                            fromY: 20, toY: 30, color: Colors.green),
                      ],
                    ),
                    // Add more bar groups for data points
                  ],
                ),
              ),
            ),
            // Add more graph cards for other attributes
          ],
        ),
      ),
    );
  }

  Widget _buildGraphCard({required String title, required Widget child}) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
