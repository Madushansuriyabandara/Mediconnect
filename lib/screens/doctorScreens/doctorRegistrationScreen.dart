// screens/doctor_registration_screen.dart

import 'package:flutter/material.dart';

class DoctorRegistrationScreen extends StatefulWidget {
  @override
  _DoctorRegistrationScreenState createState() => _DoctorRegistrationScreenState();
}

class _DoctorRegistrationScreenState extends State<DoctorRegistrationScreen> {
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = picked;
        } else {
          _selectedEndTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Doctor Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'First name')),
              TextField(decoration: InputDecoration(labelText: 'Last name')),
              TextField(decoration: InputDecoration(labelText: 'Other name/s')),
              TextField(decoration: InputDecoration(labelText: 'Age')),
              TextField(decoration: InputDecoration(labelText: 'Specialisation')),
              TextField(decoration: InputDecoration(labelText: 'Address')),
              TextField(decoration: InputDecoration(labelText: 'Doctor Registration Number')),
              TextField(decoration: InputDecoration(labelText: 'NIC')),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) {},
              ),
              TextField(decoration: InputDecoration(labelText: 'Visiting Hospitals')),
              Row(
                children: [
                  Text('Visiting Time:'),
                  TextButton(
                    onPressed: () => _selectTime(context, true),
                    child: Text(_selectedStartTime != null
                        ? _selectedStartTime!.format(context)
                        : 'From'),
                  ),
                  TextButton(
                    onPressed: () => _selectTime(context, false),
                    child: Text(_selectedEndTime != null
                        ? _selectedEndTime!.format(context)
                        : 'To'),
                  ),
                ],
              ),
              TextField(decoration: InputDecoration(labelText: 'Doctor ID (Front View)')),
              TextField(decoration: InputDecoration(labelText: 'Doctor ID (Back View)')),
              ElevatedButton(
                onPressed: () {
                  // Registration logic here
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
