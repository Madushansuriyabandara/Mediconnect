import 'package:flutter/material.dart';
import 'package:mediconnect/themes/bottomNavBar/patientBottomNavBar.dart';

class Reminders extends StatelessWidget {
  const Reminders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Medicine Reminders'),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Set Reminders",
              ),
              Tab(
                text: "My Reminders",
              ),
              Tab(
                text: "For Pharmacy Use",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SetRemindersPage(),
            MyRemindersPage(),
            PharmacyUsePage(),
          ],
        ),
        bottomNavigationBar: PatientBottomNavBar(
          currentIndex: 0,
          onTap: (index) {
            // Handle bottom navigation tap
          },
        ),
      ),
    );
  }
}

class SetRemindersPage extends StatefulWidget {
  @override
  _SetRemindersPageState createState() => _SetRemindersPageState();
}

class _SetRemindersPageState extends State<SetRemindersPage> {
  final List<Map<String, dynamic>> reminders = [
    {
      'medicine': 'Panadol - 5mg',
      'intake': 'Intake every 6 hours - before meal',
      'startTime': TimeOfDay(hour: 6, minute: 0),
      'endTime': TimeOfDay(hour: 0, minute: 0),
    },
    {
      'medicine': 'Digene - 5mg',
      'intake': 'Intake 3 times a day - before meal',
      'startTime': TimeOfDay(hour: 6, minute: 0),
      'endTime': TimeOfDay(hour: 0, minute: 0),
    },
    {
      'medicine': 'Pantodac - 15mg',
      'intake': 'Intake every 8 hours - after meal',
      'startTime': TimeOfDay(hour: 6, minute: 0),
      'endTime': TimeOfDay(hour: 0, minute: 0),
    },
  ];

  Future<void> _selectTime(
      BuildContext context, int index, String timeType) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeType == 'startTime'
          ? reminders[index]['startTime']
          : reminders[index]['endTime'],
    );
    if (picked != null) {
      setState(() {
        if (timeType == 'startTime') {
          reminders[index]['startTime'] = picked;
        } else {
          reminders[index]['endTime'] = picked;
        }
      });
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = MaterialLocalizations.of(context).formatTimeOfDay(time);
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        final reminder = reminders[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${reminder['medicine']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Intake ${reminder['intake']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Starting at'),
                        TextButton(
                          onPressed: () =>
                              _selectTime(context, index, 'startTime'),
                          child: Text(formatTimeOfDay(reminder['startTime'])),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Ending at'),
                        TextButton(
                          onPressed: () =>
                              _selectTime(context, index, 'endTime'),
                          child: Text(formatTimeOfDay(reminder['endTime'])),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyRemindersPage extends StatelessWidget {
  final List<Map<String, dynamic>> myReminders = [];

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("My Reminders Page"));
  }
}

class PharmacyUsePage extends StatelessWidget {
  final List<Map<String, dynamic>> pharmacyUse = [];

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Pharmacy Use Page"));
  }
}
