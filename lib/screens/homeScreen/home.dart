import 'package:flutter/material.dart';
import 'package:mediconnect/screens/homeScreen/appointmentDetails.dart'; // Update the path accordingly
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatelessWidget {
  final String userEmail = "johndoe@example.com";

  const HomeScreen({super.key}); // Replace with dynamic user email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_account),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Switch Account'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          ListTile(
                            title: const Text('John Doe'),
                            subtitle:
                                const Text('john.doe@example.com (Patient)'),
                            onTap: () {
                              // Switch to this account
                              Navigator.of(context).pop();
                            },
                          ),
                          ListTile(
                            title: const Text('Dr. Smith'),
                            subtitle:
                                const Text('dr.smith@example.com (Doctor)'),
                            onTap: () {
                              // Switch to this account
                              Navigator.of(context).pop();
                            },
                          ),
                          // Add more users here
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: QrImageView(
                data: userEmail,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'My Appointments',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            AppointmentButton(
              color: Colors.yellow,
              text: 'John Doe - Chest Pain',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Chest Pain',
                      doctorName: 'Dr. John Doe',
                      specialty: 'Cardiac Surgeon',
                      appointmentTime: '10:30am - 11:00am',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 34,
                      currentNumber: 23,
                      turnTime: '10:43am',
                      appointmentStatus: 'Queued',
                    ),
                  ),
                );
              },
            ),
            AppointmentButton(
              color: Colors.green,
              text: 'Simon Powel - Leg injury',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Chest Pain',
                      doctorName: 'Dr. John Doe',
                      specialty: 'Cardiac Surgeon',
                      appointmentTime: '10:30am - 11:00am',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 34,
                      currentNumber: 23,
                      turnTime: '10:43am',
                      appointmentStatus: 'Queued',
                    ),
                  ),
                );
              },
            ),
            AppointmentButton(
              color: Colors.red,
              text: 'Eddie Brownrick - Knee pain',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Chest Pain',
                      doctorName: 'Dr. John Doe',
                      specialty: 'Cardiac Surgeon',
                      appointmentTime: '10:30am - 11:00am',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 34,
                      currentNumber: 23,
                      turnTime: '10:43am',
                      appointmentStatus: 'Queued',
                    ),
                  ),
                );
              },
            ),
            AppointmentButton(
              color: Colors.blue,
              text: 'Richard Ryman - Eye',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Chest Pain',
                      doctorName: 'Dr. John Doe',
                      specialty: 'Cardiac Surgeon',
                      appointmentTime: '10:30am - 11:00am',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 34,
                      currentNumber: 23,
                      turnTime: '10:43am',
                      appointmentStatus: 'Queued',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.medication),
            label: 'Medicines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Home is selected
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}

class AppointmentButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const AppointmentButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
