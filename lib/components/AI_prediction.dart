// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  int selectedButtonIndex = 0;
  var bloodPressure = TextEditingController();
  var specificGravity = TextEditingController();
  var albumin = TextEditingController();
  var sugarLevel = TextEditingController();
  var rbc = TextEditingController();
  var cholestrolLevel = TextEditingController();
  var bloodUrea = TextEditingController();
  var serumCreatinine = TextEditingController();
  var sodium = TextEditingController();
  var potassium = TextEditingController();
  var hemoglobin = TextEditingController();
  var whiteBloodCellCount = TextEditingController();
  var redBloodCellCount = TextEditingController();
  Future addData({
    required String bp,
    required String sg,
    required String al,
    required String su,
    required String rbc,
    required String bu,
    required String sc,
    required String sod,
    required String pot,
    required String hemo,
    required String wbcc,
    required String rbcc,
  }) async {
    final docUser =
        FirebaseFirestore.instance.collection('test').doc('add_id_here');
    final json = {
      'Bp': bp,
      'Sg': sg,
      'Al': al,
      'Su': su,
      'Rbc': rbc,
      'Bu': bu,
      'Sc': sc,
      'Sod': sod,
      'Pot': pot,
      'Hemo': hemo,
      'Wbcc': wbcc,
      'Rbcc': rbcc,
    };
    await docUser.set(json).then((value) => print('data sent to firebase'));

    // Additional code to send data to the external API
    const url = 'http://18.212.13.58:8000/answers';
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "Bp": bp,
        "Sg": sg,
        "Al": al,
        "Su": su,
        "Rbc": rbc,
        "Bu": bu,
        "Sc": sc,
        "Sod": sod,
        "Pot": pot,
        "Hemo": hemo,
        "Wbcc": wbcc,
        "Rbcc": rbcc,
      }),
    );

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  }

  AppBar topBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'NephroFit',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30.0,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: topBar(context),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter your details to view AI Prediction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0, // Adjust the font size as needed
                  // You can also customize other text styles here, such as color, etc.
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
                          hintText: 'For example 120',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: albumin,
                        decoration: InputDecoration(
                          labelText: 'Enter Albumin(g/dL)',
                          hintText: 'For example 4.1 ',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: specificGravity,
                        decoration: InputDecoration(
                          labelText: 'Enter Specific Gravity(sg)',
                          hintText: 'For example 1.025',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: sugarLevel,
                        decoration: InputDecoration(
                          labelText: 'Enter Sugar Level ',
                          hintText: 'For example 0',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: rbc,
                        decoration: InputDecoration(
                          labelText: 'Enter the Red blood cell count of urine ',
                          hintText: 'For example 0 or 1',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: bloodUrea,
                        decoration: InputDecoration(
                          labelText: 'Enter Blood Urea (Bu)',
                          hintText: 'For example 94.0',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: serumCreatinine,
                        decoration: InputDecoration(
                          labelText: 'Enter Serum Creatinine (Sc)',
                          hintText: 'For example 7.3',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: sodium,
                        decoration: InputDecoration(
                          labelText: 'Enter Sodium (Sod)',
                          hintText: 'For example 137.0',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: potassium,
                        decoration: InputDecoration(
                          labelText: 'Enter Potassium (Pot)',
                          hintText: 'For example 4.3',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: hemoglobin,
                        decoration: InputDecoration(
                          labelText: 'Enter Hemoglobin (Hemo)',
                          hintText: 'For example 7.9',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: whiteBloodCellCount,
                        decoration: InputDecoration(
                          labelText: 'Enter White Blood Cell Count (Wbcc)',
                          hintText: 'For example 8406',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: redBloodCellCount,
                        decoration: InputDecoration(
                          labelText: 'Enter Red Blood Cell Count (Rbcc)',
                          hintText: 'For example 4.71',
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                      String uSpecificGravity = specificGravity.text;
                      String uAlbumin = albumin.text;
                      String uSugarLevel = sugarLevel.text;
                      String uRbc = rbc.text;
                      String uCholestrolLevel = cholestrolLevel.text;
                      String uBloodUrea = bloodUrea.text;
                      String uSerumCreatinine = serumCreatinine.text;
                      String uSodium = sodium.text;
                      String uPotassium = potassium.text;
                      String uHemoglobin = hemoglobin.text;
                      String uWbcc = whiteBloodCellCount.text;
                      String uRbcc = redBloodCellCount.text;

                      print(
                          "Blood pressure: $ubloodpressure, Sugar Level: $uSugarLevel, Cholestrol Level: $uCholestrolLevel");

                      addData(
                        bp: ubloodpressure,
                        sg: uSpecificGravity,
                        al: uAlbumin,
                        su: uSugarLevel,
                        rbc: uRbc,
                        bu: uBloodUrea,
                        sc: uSerumCreatinine,
                        sod: uSodium,
                        pot: uPotassium,
                        hemo: uHemoglobin,
                        wbcc: uWbcc,
                        rbcc: uRbcc,
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
        ));
  }
}
