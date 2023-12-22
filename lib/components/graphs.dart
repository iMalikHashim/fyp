import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World!'), // Remove this line
      ),
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
              child: SizedBox(
                height: 250, // Increase height for better visualization
                child: LineChart(LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 120), // Day 1
                        FlSpot(1, 110), // Day 2
                        FlSpot(2, 130), // Day 3
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 5,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                )),
              ),
            ),
            _buildGraphCard(
              title: 'Sugar Level',
              child: SizedBox(
                height: 250, // Increase height for better visualization
                child: BarChart(BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barGroups: [
                    BarChartGroupData(
                        x: 0,
                        barRods: [BarChartRodData(toY: 8, color: Colors.red)]),
                    BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(toY: 6, color: Colors.red)]),
                    BarChartGroupData(
                        x: 2,
                        barRods: [BarChartRodData(toY: 7, color: Colors.red)]),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphCard({required String title, required Widget child}) {
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
            child,
          ],
        ),
      ),
    );
  }
}
