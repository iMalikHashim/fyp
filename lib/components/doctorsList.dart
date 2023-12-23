import 'package:flutter/material.dart';

class DoctorListPage extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
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
    {
      'name': 'Dr. Michael Johnson',
      'expertise': 'Cardiologist',
      'location': 'Chicago',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Emily White',
      'expertise': 'Pediatrician',
      'location': 'Houston',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Daniel Brown',
      'expertise': 'Dermatologist',
      'location': 'Miami',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Jennifer Miller',
      'expertise': 'Orthopedic Surgeon',
      'location': 'San Francisco',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. David Lee',
      'expertise': 'Psychiatrist',
      'location': 'Seattle',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Sarah Taylor',
      'expertise': 'Gynecologist',
      'location': 'Dallas',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Christopher Harris',
      'expertise': 'Ophthalmologist',
      'location': 'Atlanta',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Jessica King',
      'expertise': 'Endocrinologist',
      'location': 'Boston',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Benjamin Wilson',
      'expertise': 'Neurologist',
      'location': 'Denver',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Olivia Martinez',
      'expertise': 'Rheumatologist',
      'location': 'Phoenix',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Ethan Davis',
      'expertise': 'Gastroenterologist',
      'location': 'Philadelphia',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Victoria Johnson',
      'expertise': 'Oncologist',
      'location': 'Washington D.C.',
      'imageUrl': 'url_to_image'
    },
    {
      'name': 'Dr. Nathan Turner',
      'expertise': 'Allergist',
      'location': 'Detroit',
      'imageUrl': 'url_to_image'
    },
    // Add more doctors as needed
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

class DoctorProfilePage extends StatefulWidget {
  final Map<String, dynamic> doctor;

  DoctorProfilePage({required this.doctor});

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  String selectedDate = '';
  String selectedTime = '';

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
              backgroundImage: NetworkImage(widget.doctor['imageUrl']!),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              widget.doctor['name']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '${widget.doctor['expertise']} - ${widget.doctor['location']}',
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
                  final date = DateTime.now().add(Duration(days: index));
                  final formattedDate =
                      "${date.day}/${date.month}/${date.year}";

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = formattedDate;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedDate == formattedDate
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(formattedDate),
                      ),
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
                if (selectedDate.isNotEmpty && selectedTime.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Appointment Booked'),
                        content: Text(
                          'Your appointment has been booked with ${widget.doctor['name']} on $selectedDate at $selectedTime!',
                        ),
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
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Please select date and time before booking an appointment.'),
                    ),
                  );
                }
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTiming(String timing) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = timing;
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedTime == timing ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(timing),
        ),
      ),
    );
  }
}
