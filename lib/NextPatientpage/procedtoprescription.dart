import 'package:mediconnect/NextPatientpage/prescription.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ElevatedButton procced(BuildContext context){
  return ElevatedButton(
          onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Prescription()),
      );

            if (kDebugMode) {
              print('Proceed to priscription/report button pressed!');
            }
          },
          style: ElevatedButton.styleFrom(
            
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: const Color.fromARGB(255, 3, 139, 251),
          ),
          child: const Text(
            "Proceed to Prescriptions/report",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        );
}