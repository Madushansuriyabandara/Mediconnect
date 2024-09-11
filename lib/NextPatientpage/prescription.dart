import 'package:mediconnect/homepage/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

// ignore: non_constant_identifier_names
Column Prescription_Container() {
  return const Column(
    children: [
      TextField(
        decoration: InputDecoration(labelText: 'Prescription Name'),
      ),
      TextField(
        decoration: InputDecoration(labelText: 'Dosage'),
      ),
      TextField(
        decoration: InputDecoration(labelText: 'Quantity'),
      ),
      SizedBox(height: 10,),
    ],
  );
}

class _PrescriptionState extends State<Prescription> {
  // ignore: prefer_final_fields
  List<Widget> _prescriptionList = [];

  @override
  void initState() {
    super.initState();
    // Initialize with one prescription
    _prescriptionList.add(Prescription_Container());
  }

  void _addMorePrescription() {
    setState(() {
      _prescriptionList.add(Prescription_Container());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescription"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Display all prescription containers
              ..._prescriptionList,
              const SizedBox(height: 10,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _addMorePrescription,
                    child: const Text('Add More Prescription'),
                  ),
                  const SizedBox(width: 10), // Add some spacing between buttons
                  ElevatedButton(
                    onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Home()),
                             );
                      if (kDebugMode) {
                        print("OK button clicked");
                      }
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
