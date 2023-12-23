import 'package:flutter/material.dart';

class DoctorListPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. John Doe',
      'expertise': 'Nephrologist',
      'location': 'New York',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Jane Smith',
      'expertise': 'Urologist',
      'location': 'Los Angeles',
      'imageUrl': 'url_to_image'
    },
    //Will add dynamic data
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors List'),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(doctors[index]['imageUrl']!),
            ),
            title: Text(doctors[index]['name']!),
            subtitle: Text(
                '${doctors[index]['expertise']} - ${doctors[index]['location']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DoctorProfilePage(doctor: doctors[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DoctorProfilePage extends StatelessWidget {
  final Map<String, String> doctor;

  DoctorProfilePage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(doctor['imageUrl']!),
            radius: 50,
          ),
          SizedBox(height: 20),
          Text(
            doctor['name']!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            '${doctor['expertise']} - ${doctor['location']}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
