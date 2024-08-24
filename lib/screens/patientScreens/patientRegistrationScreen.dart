import 'package:flutter/material.dart';

class PatientRegistrationForm extends StatefulWidget {
  @override
  _PatientRegistrationFormState createState() => _PatientRegistrationFormState();
}

class _PatientRegistrationFormState extends State<PatientRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _otherNamesController = TextEditingController();
  final _ageController = TextEditingController();
  final _streetNoController = TextEditingController();
  final _streetNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _nicController = TextEditingController();
  final _occupationController = TextEditingController();
  
  // Variables for dropdowns and time pickers
  String? _selectedGender;
  TimeOfDay? _breakfastTime;
  TimeOfDay? _lunchTime;
  TimeOfDay? _dinnerTime;
  String? _uploadedReportPath;

  // Gender options
  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Name fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'First name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(labelText: 'Last name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _otherNamesController,
                  decoration: InputDecoration(labelText: 'Other names'),
                ),
                SizedBox(height: 10),

                // Age field
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // Address fields
                TextFormField(
                  controller: _streetNoController,
                  decoration: InputDecoration(labelText: 'Street no.'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _streetNameController,
                  decoration: InputDecoration(labelText: 'Street name/s'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _postalCodeController,
                  decoration: InputDecoration(labelText: 'Postal Code'),
                ),
                SizedBox(height: 10),

                // Gender dropdown
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: InputDecoration(labelText: 'Gender'),
                  items: _genders.map((gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                // NIC field
                TextFormField(
                  controller: _nicController,
                  decoration: InputDecoration(labelText: 'NIC'),
                ),
                SizedBox(height: 10),

                // Meal times
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('Breakfast'),
                        trailing: Text(_breakfastTime == null ? 'Set Time' : _breakfastTime!.format(context)),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 6, minute: 0),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _breakfastTime = selectedTime;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('Lunch'),
                        trailing: Text(_lunchTime == null ? 'Set Time' : _lunchTime!.format(context)),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 12, minute: 0),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _lunchTime = selectedTime;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text('Dinner'),
                        trailing: Text(_dinnerTime == null ? 'Set Time' : _dinnerTime!.format(context)),
                        onTap: () async {
                          TimeOfDay? selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 18, minute: 0),
                          );
                          if (selectedTime != null) {
                            setState(() {
                              _dinnerTime = selectedTime;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Occupation field
                TextFormField(
                  controller: _occupationController,
                  decoration: InputDecoration(labelText: 'Occupation'),
                ),
                SizedBox(height: 10),

                // Upload reports (file picker)
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // Implement file picker logic
                          // After picking a file, set _uploadedReportPath
                        },
                        icon: Icon(Icons.upload_file),
                        label: Text('Upload Reports (If have)'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Register button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Implement form submission logic
                    }
                  },
                  child: Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
