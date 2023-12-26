// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:http/http.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  int selectedButtonIndex = 0;
  var bloodPressure = TextEditingController();
  var sugarLevel = TextEditingController();
  var cholestrolLevel = TextEditingController();
  Future addData({
    required String bp,
    required String sugarLevel,
    required String cholestrolLevel,
  }) async {
    final docUser =
        FirebaseFirestore.instance.collection('test').doc('add_id_here');
    final json = {
      'bp': bp,
      'sugarLevel': sugarLevel,
      'cholestrolLevel': cholestrolLevel,
    };
    await docUser.set(json);
    final response = await post(Uri.http("10.0.2.2:8000", "/answers"), body: {
      "Bp": '70',
      "Sg": '1.020',
      "Al": '1',
      "Su": '0',
      "Rbc": '1',
      "Bu": '94.0',
      "Sc": '7.3',
      "Sod": '137.00',
      "Pot": '4.30',
      "Hemo": '7.9',
      "Wbcc": '8406',
      "Rbcc": '4.71'
    });
    // const url = 'http://127.0.0.1:8000/answers';
    // final response = await http.post(
    //   Uri.parse(url),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     "Bp": 70,
    //     "Sg": 1.020,
    //     "Al": 1,
    //     "Su": 0,
    //     "Rbc": 1,
    //     "Bu": 94.0,
    //     "Sc": 7.3,
    //     "Sod": 137.00,
    //     "Pot": 4.30,
    //     "Hemo": 7.9,
    //     "Wbcc": 8406,
    //     "Rbcc": 4.71
    //   }),
    // );

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  }

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
                    // Navigate to the ViewReports screen using the named route
                    Navigator.pushNamed(context, '/viewReports');
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
            child: Container(
              width: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: bloodPressure,
                    decoration: InputDecoration(
                      labelText: 'Enter Blood Pressure',
                      hintText: 'For example 120/80',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFF055B5C),
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 15, 106, 107)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 15, 106, 107)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: sugarLevel,
                    decoration: InputDecoration(
                      labelText: 'Enter Sugar Level ',
                      hintText: 'For example 70mg/dL',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Color(0xFF055B5C),
                          )),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(11.),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 15, 106, 107)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 15, 106, 107)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: cholestrolLevel,
                    decoration: InputDecoration(
                      labelText: 'Enter Cholesterol Level',
                      hintText: 'For example 200 mg/dL',
                      labelStyle: TextStyle(
                        color: cholestrolLevel.text.isNotEmpty
                            ? Colors.blue
                            : Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Color(0xFF055B5C),
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 15, 106, 107)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 15, 106, 107)),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              padding: EdgeInsets.only(right: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  String ubloodpressure = bloodPressure.text;
                  String uCholestrolLevel = cholestrolLevel.text;
                  String uSugarLevel = sugarLevel.text;

                  print(
                      "Blood pressure: $ubloodpressure, Sugar Level: $uSugarLevel, Cholestrol Level: $uCholestrolLevel");

                  // Call the modified addData function
                  addData(
                    bp: ubloodpressure,
                    sugarLevel: uSugarLevel,
                    cholestrolLevel: uCholestrolLevel,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF055B5C),
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
