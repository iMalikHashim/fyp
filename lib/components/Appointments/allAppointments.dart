import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Import the intl package for date formatting

class PeopleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> people = [
      {
        'name': 'Mastora',
        'time': '10 am',
        'date': '01/02/2024',
        'status': 'Complete'
      },
      {
        'name': 'Fatima',
        'time': '1 pm',
        'date': '01/02/2024',
        'status': 'Missed'
      },
      // {'name': 'Bob', 'time': '8 pm', 'date':'01/02/2024', 'status': 'Pending'},
      {
        'name': 'Hania',
        'time': '8 pm',
        'date': '01/02/2024',
        'status': 'Cancelled'
      },
      {
        'name': 'Maryam',
        'time': '6 pm',
        'date': '01/02/2024',
        'status': 'Postponed'
      },
      // {'name': 'Hania', 'time': '8 pm', 'date':'01/02/2024','status': ''},
    ];

    Widget getStatusWidget(String status) {
      Color color;
      switch (status) {
        case 'Complete':
          color = Colors.green;
          break;
        case 'Missed':
          color = Colors.red;
          break;
        case 'Pending':
          color = Colors.yellow;
          break;
        case 'Cancelled':
          color = Colors.red;
          break;
        case 'Postponed':
          color = Colors.blue;
          break;
        default:
          color = Colors.grey;
      }
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: TextStyle(color: color),
        ),
      );
    }

    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return Padding(
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
                      Row(
                        children: [
                          Text("Date:", style: TextStyle(fontSize: 16.0)),
                          SizedBox(width: 8.0),
                          Text(
                            person['date'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.0),
                      Row(
                        children: [
                          Text("Time", style: TextStyle(fontSize: 16.0)),
                          SizedBox(width: 8.0),
                          Text(
                            person['time'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.0),
                getStatusWidget(person['status']),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AllAppointments extends StatelessWidget {
  AppBar topBar(BuildContext context) {
    return AppBar(
      title: Text(
        'All Appointments',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xFF08979D),
      foregroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PeopleList(),
            ),
          ),
        ],
      ),
    );
  }
}
