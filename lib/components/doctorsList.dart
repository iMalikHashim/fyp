import 'package:flutter/material.dart';

class DoctorListPage extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
    {'name': 'Dr. John Doe', 'expertise': 'Nephrologist', 'location': 'New York', 'imageUrl': 'url_to_image'},
    {'name': 'Dr. Jane Smith', 'expertise': 'Urologist', 'location': 'Los Angeles', 'imageUrl': 'url_to_image'},
    //We'll use dynamic data 
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
            subtitle: Text('${doctors[index]['expertise']} - ${doctors[index]['location']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorProfilePage(doctor: doctors[index]),
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
  final Map<String, dynamic> doctor;

  DoctorProfilePage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's Profile"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
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
            SizedBox(height: 20),
            Text(
              'Introduction:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod odio vel risus tincidunt, non aliquam justo vulputate.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Available Dates:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  // You may want to replace this with actual dates
                  return Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('Date ${index + 1}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Available Timings:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildTiming('9:00 AM'),
                  buildTiming('10:00 AM'),
                  buildTiming('11:00 AM'),
                  buildTiming('1:00 PM'),
                  buildTiming('3:00 PM'),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Appointment Booked'),
                      content: Text('Your appointment has been booked with ${doctor['name']}!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTiming(String timing) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(timing),
      ),
    );
  }
}
