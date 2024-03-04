import 'package:flutter/material.dart';

class DisplayDataScreen extends StatelessWidget {
  final String name;
  final String age;
  final String phoneNumber;
  final String address;
  final String medicalHistory;
  final String gender;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  DisplayDataScreen({
    required this.name,
    required this.age,
    required this.phoneNumber,
    required this.address,
    required this.medicalHistory,
    required this.gender,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Age: $age',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Phone Number: $phoneNumber',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Address: $address',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Medical History: $medicalHistory',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Gender: $gender',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Selected Date: ${selectedDate != null ? selectedDate!.toString().substring(0, 10) : 'Not selected'}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Selected Time: ${selectedTime != null ? selectedTime!.format(context) : 'Not selected'}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
