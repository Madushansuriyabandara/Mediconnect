import 'package:flutter/material.dart';
import 'package:mediconnect/themes/bottomNavBar/patientBottomNavBar.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // Notification 1
          Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              title: Text("Appointment Reminder"),
              subtitle: Text(
                  "Your appointment with Dr. Smith is scheduled for tomorrow at 10:00 AM."),
            ),
          ),
          const SizedBox(height: 10),

          // Notification 2
          Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              title: Text("New Message from Dr. Johnson"),
              subtitle:
                  Text("You have a new message regarding your test results."),
            ),
          ),
          const SizedBox(height: 10),

          // Notification 3
          Card(
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              title: Text("Prescription Update"),
              subtitle: Text("Your prescription has been updated by Dr. Lee."),
            ),
          ),

          const SizedBox(height: 10),

          // Notification 4
          Card(
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              subtitle: Text("Don't forget to update your medicine intake."),
            ),
          ),

          const SizedBox(height: 10),

          // Notification 5
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              subtitle: Text(
                  "Your medicines are ready. You can buy them at Medicare Pharmacy."),
            ),
          ),

          const SizedBox(height: 10),

          // Notification 5
          Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.notification_important, color: Colors.blue),
              title: Text("Appointment Reminder"),
              subtitle: Text(
                  "Dr. John Doe will come to Suwa Piyasa at 10.40am . Your appoinmeny details have updated"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: PatientBottomNavBar(
        currentIndex: 3, // Index for the 'Search' tab
        onTap: (index) {
          // Implement onTap callback functionality here
          // The switch-case in the PatientBottomNavBar will handle the navigation
        },
      ),
    );
  }
}
