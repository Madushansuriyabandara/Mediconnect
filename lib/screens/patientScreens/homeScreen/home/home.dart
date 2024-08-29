import 'package:flutter/material.dart';
import 'package:mediconnect/screens/patientScreens/homeScreen/appointmentDetails.dart'; // Update the path accordingly
import 'package:mediconnect/themes/appointmentStatusColors.dart'; // Import the color file
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mediconnect/themes/switchUser.dart'; // Import switchUser
import 'package:mediconnect/themes/bottomNavBar/patientBottomNavBar.dart'; // Update the path as per your project structure


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
              switchUser(context);
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
              color: getAppointmentStatusColor('Queued'),
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
              color: getAppointmentStatusColor('Upcoming'),
              text: 'Simon Powel - Leg injury',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Leg injury',
                      doctorName: 'Dr. Simon Powel',
                      specialty: 'Orthopedic Surgeon',
                      appointmentTime: '11:00am - 11:30am',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 35,
                      currentNumber: 25,
                      turnTime: '11:15am',
                      appointmentStatus: 'Upcoming',
                    ),
                  ),
                );
              },
            ),
            AppointmentButton(
              color: getAppointmentStatusColor('Missed'),
              text: 'Eddie Brownrick - Knee pain',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Knee pain',
                      doctorName: 'Dr. Eddie Brownrick',
                      specialty: 'Orthopedic Surgeon',
                      appointmentTime: '11:30am - 12:00pm',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 36,
                      currentNumber: 26,
                      turnTime: '11:45am',
                      appointmentStatus: 'Missed',
                    ),
                  ),
                );
              },
            ),
            AppointmentButton(
              color: getAppointmentStatusColor('Completed'),
              text: 'Richard Ryman - Eye',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentDetailsScreen(
                      appointmentName: 'Eye Checkup',
                      doctorName: 'Dr. Richard Ryman',
                      specialty: 'Ophthalmologist',
                      appointmentTime: '12:00pm - 12:30pm',
                      appointmentDate: 'February 15, 2024',
                      location: 'Suwa Piyasa - Kurunegala',
                      appointmentNumber: 37,
                      currentNumber: 27,
                      turnTime: '12:15pm',
                      appointmentStatus: 'Completed',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: PatientBottomNavBar(
        currentIndex: 2,
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
