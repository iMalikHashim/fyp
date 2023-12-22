import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BloodPressure extends StatelessWidget {
  const BloodPressure({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BloodPressureGraph(),
      ),
    );
  }
}

class BloodPressureGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Pressure Monitoring')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildGraphCard(
              title: 'Blood Pressure (Daily)',
              data: [
                BloodPressureData(day: 'Day 1', pressure: 120),
                BloodPressureData(day: 'Day 2', pressure: 110),
                BloodPressureData(day: 'Day 3', pressure: 130),
                // Add more data for each day
              ],
            ),
            _buildGraphCard(
              title: 'Blood Pressure (Weekly)',
              data: [
                BloodPressureData(day: 'Week 1', pressure: 120),
                BloodPressureData(day: 'Week 2', pressure: 110),
                BloodPressureData(day: 'Week 3', pressure: 130),
                // Add more data for each week
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphCard(
      {required String title, required List<BloodPressureData> data}) {
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
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    drawHorizontalLine: true,
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                          data.length,
                          (index) => FlSpot(index.toDouble(),
                              data[index].pressure.toDouble())),
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
    );
  }
}

class BloodPressureData {
  final String day;
  final int pressure;

  BloodPressureData({required this.day, required this.pressure});
}
