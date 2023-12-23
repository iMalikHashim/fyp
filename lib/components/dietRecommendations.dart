// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fyp/components/DietRecommendations/tabs/ckdTab.dart';
import 'package:fyp/components/DietRecommendations/tabs/bpTab.dart';
import 'package:fyp/components/DietRecommendations/tabs/diabetesTab.dart';
// import './GFR/tabContent.dart'; // Import the TabContent file

class DietRecommendations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Diet Recommendation',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 26,
                // color: Color(0xFF055B5C),
              ),
            ),
          ),
          backgroundColor:
              Color(0xFF08979D), // Set your desired background color
          elevation: 0, // Set elevation to 0 to remove the shadow
          bottom: TabBar(
            indicatorWeight: 2.0,
            tabs: [
              Tab(
                // icon: Icon(Icons.calculate),
                text: 'CKD',
              ),
              Tab(
                // icon: Icon(Icons.bolt),
                text: 'BP',
              ),
              Tab(
                // icon: Icon(Icons.add_ic_call_outlined),
                text: 'Diabetes',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CkdTab(), // Use Tab1Content widget for Tab 1
            BpTab(), // Use Tab2Content widget for Tab 2
            DiabetesTab(), // Use Tab3Content widget for Tab 3
            // Use Tab4Content widget for Tab 4
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
