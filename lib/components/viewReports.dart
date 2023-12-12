// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ViewReportScreen extends StatefulWidget {
  @override
  State<ViewReportScreen> createState() => _ViewReportScreenState();
}

class _ViewReportScreenState extends State<ViewReportScreen> {
  int selectedButtonIndex = 1;

  AppBar topBar() {
    return AppBar(
      title: const Text(
        'Diabetes and Kidney Monitoring',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 30.0,
      ),
      actions: [
        IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topBar(),
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
                    side: BorderSide(
                      color: selectedButtonIndex == 0
                          ? Color(0xFF055B5C)
                          : Colors.transparent,
                      width: 1.0, // Adjust the width as needed
                    ),
                  ),
                  child: Text(
                    'Add Reports',
                    style: TextStyle(
                      color: selectedButtonIndex == 0
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedButtonIndex = 1;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedButtonIndex == 1
                        ? Colors.white
                        : Color(0xFF055B5C),
                    onPrimary: Colors.black,
                    side: BorderSide(
                      color: selectedButtonIndex == 1
                          ? Color(0xFF055B5C)
                          : Colors.transparent,
                      width: 1.0, // Adjust the width as needed
                    ),
                  ),
                  child: Text(
                    'View Reports',
                    style: TextStyle(
                      color: selectedButtonIndex == 1
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 36.0,
                  margin: EdgeInsets.only(top: 10.0, right: 8.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border:
                        Border.all(color: Colors.black), // Set the border color
                    borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                  ),
                  child: DropdownButton<String>(
                    value: 'Sort by', // Replace with your actual selected value

                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                      // Add your logic to handle sorting
                    },
                    underline: Container(),

                    items: <String>[
                      'Sort by',
                      'Sort Option 1',
                      'Sort Option 2',
                      'Sort Option 3',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                // height: 1.0,
                width: 300,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Report 4',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_right, size: 18.0),
                      ],
                    ),
                    // Add text under "Report 4" here
                    Text(
                      'Additional Text',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                // height: 1.0,
                width: 300,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Report 3',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_right, size: 18.0),
                      ],
                    ),
                    // Add text under "Report 4" here
                    Text(
                      'Additional Text',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                // height: 1.0,
                width: 300,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Report 3',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_right, size: 18.0),
                      ],
                    ),
                    // Add text under "Report 4" here
                    Text(
                      'Additional Text',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                // height: 1.0,
                width: 300,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Report 1',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_right, size: 18.0),
                      ],
                    ),
                    // Add text under "Report 4" here
                    Text(
                      'Additional Text',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
