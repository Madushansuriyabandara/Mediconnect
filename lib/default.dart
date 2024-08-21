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

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        width: _selectedIndex == index ? 0 : 0,
        height: _selectedIndex == index ? 0 : 0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index
              ? const Color.fromARGB(255, 220, 173, 100)
              : Colors.transparent,
        ),
        child: Icon(icon, size: 25),
      ),
      label: '',
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
          _buildBottomNavigationBarItem(Icons.task, 0), 
          _buildBottomNavigationBarItem(Icons.message, 1),
          _buildBottomNavigationBarItem(Icons.home, 2),
          _buildBottomNavigationBarItem(Icons.notifications, 3),
          _buildBottomNavigationBarItem(Icons.account_circle, 4),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
