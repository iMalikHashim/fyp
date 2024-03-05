import 'package:flutter/material.dart';
import 'package:fyp/components/Appointments/requestDetail.dart';

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> people = [
      {'name': 'John', 'description': 'For Monday 01/05/2024'},
      {'name': 'Alice', 'description': 'For Sunday 01/05/2024'},
      {'name': 'Bob', 'description': 'For Friday 08/04/2024'},
    ];
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(person: person),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: Icon(Icons.person, size: 24, color: Colors.white),
                    backgroundColor: Color(0xFF055B5C),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person['name'],
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          person['description'],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check, color: Colors.green),
                      SizedBox(width: 8.0),
                      Icon(Icons.close, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RequestAppointment extends StatelessWidget {
  AppBar topBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Appointment Requests',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF08979D),
      foregroundColor: Colors.white,
      // centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: topBar(context),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PeopleList(),
        ),
      ),
    );
  }
}
