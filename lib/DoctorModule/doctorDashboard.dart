import 'package:flutter/material.dart';
import 'package:fyp/DoctorModule/doctorHome.dart';
import 'package:fyp/components/addReports.dart';
import 'package:fyp/components/AI_prediction.dart';
import 'package:fyp/components/calculateGFR.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      drawer: AppDrawer(),
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
            icon: Icon(Icons.bolt),
            label: 'AI Prediction',
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
      actions: [
        // IconButton(
        //   onPressed: () => {},
        //   icon: const Icon(
        //     Icons.notifications,
        //     color: Colors.black,
        //     size: 30.0,
        //   ),
        // ),
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
    return HomePage();
  }

  Widget _buildAddReport() {
    // Replace with your add report page content
    return const AddReportScreen();
  }

  Widget _buildEGFRPage() {
    // Replace with your eGFR page content
    return EGFRPage();
  }

  Widget _buildSettings() {
    // Replace with your settings page content
    return const PredictionScreen();
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    retrieveStoredData();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('NephroFit'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Add Appointmentg'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Calculate eGFR'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> retrieveStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? userId = prefs.getString('userId');

    // Use the retrieved data as needed
    print('Retrieved email: $email');
    print('Retrieved userId: $userId');
  }
}
