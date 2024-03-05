import 'package:flutter/material.dart';
import 'package:fyp/model/DoctorModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorSearchPage extends StatefulWidget {
  @override
  _DoctorSearchPageState createState() => _DoctorSearchPageState();
}

class _DoctorSearchPageState extends State<DoctorSearchPage> {
  List<Doctor> doctors = [];
  String filterLocation = '';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  Stream<List<Doctor>> streamDoctors() {
    return _firestore.collection('DoctorData').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Doctor.fromSnapshot(doc)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
          StreamBuilder<List<Doctor>>(
            stream: streamDoctors(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.error != null) {
                return Center(child: Text('An error has occurred!'));
              }

              doctors = snapshot.data!
                  .where((doctor) => doctor.location.contains(filterLocation))
                  .toList();

              return Expanded(
                child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    Doctor doctor = doctors[index];
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(doctor.name),
                      subtitle: Text(
                          '${doctor.specialty}, ${doctor.experience ?? ''}, ${doctor.location}'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
