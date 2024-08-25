import 'package:flutter/material.dart';
import 'package:mediconnect/screens/doctorScreens/doctorRegistrationScreen.dart';
import 'package:mediconnect/screens/patientScreens/patientRegistrationScreen.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I am a,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to doctor registration form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientRegistrationForm()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.local_hospital, size: 50),
                      Text('Doctor'),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to patient registration form
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorRegistrationScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.person, size: 50),
                      Text('Patient'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
