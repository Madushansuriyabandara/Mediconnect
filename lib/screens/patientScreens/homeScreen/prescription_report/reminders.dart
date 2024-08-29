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
  State<SetRemindersPage> createState() => _SetRemindersPageState();
}

class _SetRemindersPageState extends State<SetRemindersPage> {
  final List<Map<String, dynamic>> reminders = [
    {
      'medicine': 'Panadol - 5mg',
      'intake': 'Intake: every 6 hours - before meal',
      'startTime': TimeOfDay(hour: 6, minute: 0),
      'endTime': TimeOfDay(hour: 0, minute: 0),
    },
    {
      'medicine': 'Digene - 5mg',
      'intake': 'Intake: 3 times a day - before meal',
      'startTime': TimeOfDay(hour: 6, minute: 0),
      'endTime': TimeOfDay(hour: 0, minute: 0),
    },
    {
      'medicine': 'Pantodac - 15mg',
      'intake': 'Intake: every 8 hours - after meal',
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
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme:
                ColorScheme.light(primary: Color.fromARGB(255, 96, 142, 180)),
          ),
          child: child!,
        );
      },
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${reminder['medicine']}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${reminder["intake"]}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Starting at",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        onPressed: () =>
                            _selectTime(context, index, 'startTime'),
                        child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Text(
                              formatTimeOfDay(reminder['startTime']),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Ending at",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        onPressed: () => _selectTime(context, index, 'endTime'),
                        child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Text(
                              formatTimeOfDay(reminder['endTime']),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
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
