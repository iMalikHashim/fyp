// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  int selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "NephroFit",
          style: TextStyle(
              color: Colors.black, // Set text color to black
              fontWeight: FontWeight.bold,
              fontSize: 30.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Set background color to white
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
            onPressed: () {
              // Add your notification icon onPressed logic here
            },
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 0;
                    });
                    // Navigate to the ViewReports screen using the named route
                    Navigator.pushNamed(context, '/addReports');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedButtonIndex == 0
                        ? Colors.white
                        : Color(0xFF055B5C),
                    onPrimary: Colors.black,
                  ),
                  child: Text('Add Reports'),
                ),
                SizedBox(
                  width: 4.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 1;
                    });
                    // Navigate to the ViewReports screen using the named route
                    Navigator.pushNamed(context, '/viewReports');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedButtonIndex == 1
                        ? Colors.white
                        : Color(0xFF055B5C),
                    onPrimary: Colors.black,
                  ),
                  child: Text('View Reports'),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              width: 300,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Blood Pressure',
                      hintText: 'For example 120/80',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Color(0xFF055B5C),
                          )),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(11.),
                        borderSide: BorderSide(color: Color(0xFF055B5C)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Sugar Level ',
                      hintText: 'For example 70mg/dL',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Color(0xFF055B5C),
                          )),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(11.),
                        borderSide: BorderSide(color: Color(0xFF055B5C)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter Cholesterol Level',
                      hintText: 'For example 200 mg/dL',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Color(0xFF055B5C),
                          )),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(11.),
                        borderSide: BorderSide(color: Color(0xFF055B5C)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

          // Save button
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding:
                  EdgeInsets.only(right: 16.0), // Adjust the padding as needed
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF055B5C), // Set the desired color
                ),
                child: const Text('Save'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
