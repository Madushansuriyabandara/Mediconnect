import 'package:flutter/material.dart';
import 'package:mediconnect/screens/startScreens/registerScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check login credentials and device ID
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to register screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
}
