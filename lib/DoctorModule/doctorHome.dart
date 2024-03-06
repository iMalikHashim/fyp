import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your eGFR page content here
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/girl.png'),
                  radius: 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align text to the start of the column
                    children: [
                      const Text(
                        'Hajrah Virk',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      Row(
                        children: [
                          // const Text(
                          //   'View reports',
                          //   style: TextStyle(fontSize: 16, color: Colors.grey),
                          // ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     Icons.arrow_circle_right_outlined,
                          //     color: Color.fromARGB(255, 14, 7, 7),
                          //     size: 30.0,
                          //   ),
                          //   color: Colors.black,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        // Navigate to the ViewReports screen using the named route
                        Navigator.pushNamed(context, '/addReports');
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Color.fromARGB(255, 14, 7, 7),
                        size: 30.0,
                      ),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
              indent: 50,
              endIndent: 50,
              color: Colors.cyan[800],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Current Stats',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      'View reports',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Color.fromARGB(255, 14, 7, 7),
                        size: 30.0,
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hemo',
                  style: TextStyle(fontSize: 18, color: Colors.cyan),
                ),
                Divider(
                  color: Colors.cyan[800],
                ),
                Text(
                  '89/80 mmHg',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sg',
                  style: TextStyle(fontSize: 18, color: Colors.cyan),
                ),
                Divider(
                  color: Colors.cyan[800],
                ),
                Text(
                  '102/80 mmHg',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bu',
                  style: TextStyle(fontSize: 18, color: Colors.cyan),
                ),
                Divider(
                  color: Colors.cyan[800],
                ),
                Text(
                  '90/80 mmHg',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'BP',
                  style: TextStyle(fontSize: 18, color: Colors.cyan),
                ),
                Divider(
                  color: Colors.cyan[800],
                ),
                Text(
                  '120/80 mmHg',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                height: 20,
                thickness: 1,
                indent: 50,
                endIndent: 50,
                color: Colors.cyan[800],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate or perform action on image click
                        Navigator.pushNamed(context, '/bloodpressure');
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10, 10, 0),
                        child: Image.asset(
                          'assets/images/history.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 5, 20, 10),
                      child: Text(
                        'Manage Appointments',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate or perform action on image click
                        Navigator.pushNamed(context, '/diabetes');
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10, 10, 0),
                        child: Image.asset(
                          'assets/images/consultaDoc.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 5, 20, 10),
                      child: Text(
                        'All Patients',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate or perform action on image click
                        Navigator.pushNamed(context, '/exercise');
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(45.0, 10, 10, 0),
                        child: Image.asset(
                          'assets/images/riskFactors.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(45.0, 5, 20, 10),
                      child: Text(
                        'AI prediction',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate or perform action on image click
                        Navigator.pushNamed(context, '/dietRecommendation');
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(55.0, 10, 10, 0),
                        child: Image.asset(
                          'assets/images/precautions.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 5, 20, 10),
                      child: Text(
                        'Consultation History',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
