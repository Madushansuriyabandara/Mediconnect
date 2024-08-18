import 'package:flutter/material.dart';
import 'screens/patientScreens/homeScreen/home.dart';  // Import the home.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mediconnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Set the home screen to the HomeScreen widget
    );
  }
}
