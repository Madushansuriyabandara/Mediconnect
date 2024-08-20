import 'package:flutter/material.dart';

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
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            // Search Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement search functionality here
                },
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
