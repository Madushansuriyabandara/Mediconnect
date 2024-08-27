import 'package:flutter/material.dart';
import 'package:mediconnect/screens/patientScreens/searchScreen/searchResultPage.dart';
import 'package:mediconnect/themes/bottomNavBar/patientBottomNavBar.dart';

class SearchDoctor extends StatelessWidget {
  final TextEditingController doctorNameController = TextEditingController();
  final TextEditingController diseaseController = TextEditingController();
  final TextEditingController medicalCenterController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search for a Doctor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Search by Doctor Name
            TextField(
              controller: doctorNameController,
              decoration: const InputDecoration(
                labelText: 'Search by Doctor Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Search by Disease
            TextField(
              controller: diseaseController,
              decoration: const InputDecoration(
                labelText: 'Search by Disease',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Search by Medical Center/Hospital
            TextField(
              controller: medicalCenterController,
              decoration: const InputDecoration(
                labelText: 'Search by Medical Center/Hospital',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Search by Date
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                labelText: 'Search by Date',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 10),

            // Search by Time
            TextField(
              controller: timeController,
              decoration: const InputDecoration(
                labelText: 'Search by Time',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),

            // Spacer to push the Search button to the bottom
            Spacer(),

            // Search Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResultsPage(
                        doctorName: doctorNameController.text.isEmpty
                            ? null
                            : doctorNameController.text,
                        disease: diseaseController.text.isEmpty
                            ? null
                            : diseaseController.text,
                        medicalCenter: medicalCenterController.text.isEmpty
                            ? null
                            : medicalCenterController.text,
                        date: dateController.text.isEmpty
                            ? null
                            : dateController.text,
                        time: timeController.text.isEmpty
                            ? null
                            : timeController.text,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: Colors.black, width: 2.0), // Black border
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: PatientBottomNavBar(
        currentIndex: 1, // Index for the 'Search' tab
        onTap: (index) {},
      ),
    );
  }
}
