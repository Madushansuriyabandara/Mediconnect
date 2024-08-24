import 'package:flutter/material.dart';
import 'package:mediconnect/screens/startScreens/roleSelection.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Account'),
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
                // Send verification email and redirect to role selection
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoleSelectionScreen()),
                );
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10),
            Text('Or'),
            ElevatedButton.icon(
              icon: Icon(Icons.email),
              label: Text('Sign Up with Google'),
              onPressed: () {
                // Handle Google Sign up
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.facebook),
              label: Text('Sign Up with Facebook'),
              onPressed: () {
                // Handle Facebook Sign up
              },
            ),
          ],
        ),
      ),
    );
  }
}
