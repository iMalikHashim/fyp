import 'package:flutter/material.dart';
import 'package:fyp/components/Appointments/allAppointments.dart';
import 'package:fyp/components/Appointments/historyAppointments.dart';
import 'package:fyp/components/Appointments/requestAppointment.dart';
import 'package:fyp/components/Appointments/scheduleAppointments.dart';
import 'package:fyp/components/Appointments/todaysAppointment.dart';

class ManageAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              Center(child: Text("Manage Appointments")), // Center align title
          backgroundColor: Color(0xFF08979D), // Set app bar color
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AppointmentOptions(),
          ),
        ),
      ),
    );
  }
}

class AppointmentOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Hello Dr. Welcome and manage your appointments.',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildListItem(
          context,
          title: "View Today's Appointments",
          icon: Icons.calendar_today, // Add icon
          onTap: () {
            // Navigate to view today's appointments screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TodaysAppointment()),
            );
          },
        ),
        _buildListItem(
          context,
          title: "Schedule New Appointments",
          icon: Icons.event_available, // Add icon
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScheduleAppointmentScreen()),
            );
            // ScheduleAppointmentScreen()
            // Navigate to schedule new appointments screen
          },
        ),
        _buildListItem(
          context,
          title: "View Appointments History",
          icon: Icons.history, // Add icon
          onTap: () {
            // Navigate to view appointments history screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryAppointments()),
            );
          },
        ),
        _buildListItem(
          context,
          title: "View Appointment Requests",
          icon: Icons.notifications, // Add icon
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RequestAppointment()),
            );
            // Navigate to view appointment requests screen
          },
        ),
        _buildListItem(
          context,
          title: "View All Appointment ",
          icon: Icons.list, // Add icon
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AllAppointments()),
            );
            // Navigate to view appointment requests screen
          },
        ),
        _buildListItem(
          context,
          title: "View Cancelled Appointments ",
          icon: Icons.cancel, // Add icon
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => RequestAppointment()),
            // );
            // Navigate to view appointment requests screen
          },
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context,
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Set container width
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: InkWell(
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                icon,
                color: Color(0xFF08979D), // Set icon color
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
        ),
      ),
    );
  }
}
