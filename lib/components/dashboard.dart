import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
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
                          const Text(
                            'View reports',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
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
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: IconButton(
                      onPressed: () {},
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10, 40, 10),
                        child: Image(
                            image: AssetImage('assets/images/history.png'))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 10, 20, 10),
                        child: Image(
                            image: AssetImage('assets/images/precautions.png')))
                  ],
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 10, 40, 10),
                        child: Image(
                            image:
                                AssetImage('assets/images/riskFactors.png'))),
                    Padding(
                        padding: EdgeInsets.fromLTRB(40.0, 10, 20, 10),
                        child: Image(
                            image: AssetImage('assets/images/consultaDoc.png')))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add report',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        selectedItemColor: Colors.cyan[800],
      ),
    );
  }

  AppBar topBar() {
    return AppBar(
      title: const Text(
        'CKD',
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
}
