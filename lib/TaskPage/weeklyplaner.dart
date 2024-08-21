import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WeekPlanner extends StatefulWidget {
  const WeekPlanner({super.key});

  @override
  State<WeekPlanner> createState() => _WeekPlannerState();
}

class _WeekPlannerState extends State<WeekPlanner> {
  final _formKey = GlobalKey<FormState>();
  String _taskTitleValue = ''; // Title of the task
  final _fromHourController = TextEditingController(); // Hours of "from" value
  final _fromMinuteController = TextEditingController(); // Minutes of "from" value
  String _fromAmPm = 'AM'; // AM/PM for "from" value

  Future<void> _selectTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // Convert 24-hour time to 12-hour format
      final hour = selectedTime.hourOfPeriod;
      final minute = selectedTime.minute;
      final amPm = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

      // Update controllers and state
      setState(() {
        _fromHourController.text = hour.toString().padLeft(2, '0');
        _fromMinuteController.text = minute.toString().padLeft(2, '0');
        _fromAmPm = amPm;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (kDebugMode) {
        print('Entered text: $_taskTitleValue');
        print('Time: ${_fromHourController.text}:${_fromMinuteController.text} $_fromAmPm');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Week Planner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 225,
              color: const Color.fromARGB(255, 207, 205, 205),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.zero,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.zero,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.zero,
                        ),
                        labelText: 'Task Title...',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                      onSaved: (value) {
                        _taskTitleValue = value ?? '';
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    
                    children: [
                      TextButton(
                        onPressed: _selectTime,
                        child: const Text("From"),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 10),
                                controller: _fromHourController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  labelText: 'hrs',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 2), // Reduced width
                            const Text(":"),
                            const SizedBox(width: 2), // Reduced width
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: TextFormField(
                                style: const TextStyle(fontSize: 10),
                                controller: _fromMinuteController,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  labelText: 'min',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 2), // Reduced width
                            SizedBox(
                              width: 50, // Adjust width as needed
                              height: 30,
                              child: DropdownButtonFormField<String>(
                                value: _fromAmPm,
                                items: const [
                                  DropdownMenuItem(value: 'AM', child: Text('AM')),
                                  DropdownMenuItem(value: 'PM', child: Text('PM')),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _fromAmPm = value ?? 'AM';
                                  });
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black, width: 0.5),
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
