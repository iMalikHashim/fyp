import 'package:flutter/material.dart';
import './GFR/tabContent.dart'; // Import the TabContent file

class EGFRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('eGFR Calculation'),
          backgroundColor: Colors.blueGrey, // Set your desired background color
          elevation: 0, // Set elevation to 0 to remove the shadow
          bottom: TabBar(
            indicatorWeight: 2.0,
            tabs: [
              Tab(
                icon: Icon(Icons.calculate),
                text: 'Calculator',
              ),
              Tab(
                icon: Icon(Icons.bolt),
                text: 'Formula',
              ),
              Tab(
                icon: Icon(Icons.add_ic_call_outlined),
                text: 'Clinidal Use',
              ),
              Tab(
                icon: Icon(Icons.book_sharp),
                text: 'References',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab1Content(), // Use Tab1Content widget for Tab 1
            Tab2Content(), // Use Tab2Content widget for Tab 2
            Tab3Content(), // Use Tab3Content widget for Tab 3
            Tab4Content(), // Use Tab4Content widget for Tab 4
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String content) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
