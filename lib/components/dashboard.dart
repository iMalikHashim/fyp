import 'package:flutter/material.dart';
import 'home.dart';
import 'calculateGFR.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardNavigation createState() => _DashboardNavigation();
}

class _DashboardNavigation extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Check the selected index and navigate accordingly
    if (_selectedIndex == 2) {
      // Do nothing for now or perform any additional actions as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(),
      body: _buildBody(),
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
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate eGFR',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.white,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        elevation: 5,
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

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHome();
      case 1:
        return _buildAddReport();
      case 2:
        return _buildEGFRPage();
      case 3:
        return _buildSettings();
      default:
        return Container();
    }
  }

  Widget _buildHome() {
    // Replace with your home page content
    return HomePage();
  }

  Widget _buildAddReport() {
    // Replace with your add report page content
    return Center(
      child: Text('Add Report Page'),
    );
  }

  Widget _buildEGFRPage() {
    // Replace with your eGFR page content
    return EGFRPage();
  }

  Widget _buildSettings() {
    // Replace with your settings page content
    return Center(
      child: Text('Settings Page'),
    );
  }
}
