import 'package:flutter/material.dart';
import 'package:fyp/model/DoctorModel.dart';

class DoctorSearchPage extends StatefulWidget {
  @override
  _DoctorSearchPageState createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
  List<Doctor> doctors = []; // Initialize with your list of doctors
  String filterLocation = '';

  @override
  Widget build(BuildContext context) {
    List<Doctor> filteredDoctors = doctors
        .where((doctor) => doctor.location.contains(filterLocation))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Filter by location',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  filterLocation = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                Doctor doctor = filteredDoctors[index];
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(doctor.name),
                  subtitle: Text(
                      '${doctor.specialty},${doctor.experience}, ${doctor.location}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
