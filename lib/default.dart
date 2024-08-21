import 'package:doctor/TaskPage/mytask.dart';
import 'package:flutter/material.dart';
import 'homepage/home.dart';
void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const TaskPage(),
    const Text('Message Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Home(),
    const Text('Notification', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    const Text('Profile', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon:Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: [
          _buildBottomNavigationBarItem(Icons.edit_calendar, 'Schedule'), 
          _buildBottomNavigationBarItem(Icons.bar_chart, 'Stats'),
          _buildBottomNavigationBarItem(Icons.home, 'Home'),
          _buildBottomNavigationBarItem(Icons.notifications, 'Notifications'),
          _buildBottomNavigationBarItem(Icons.person, 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(41, 145, 168, 1),
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        onTap: _onItemTapped,
      ),
    );
  }
}
