import 'package:flutter/material.dart';
import 'package:mediconnect/screens/patientScreens/searchScreen/makeAppoinment.dart';

class SearchResultsPage extends StatelessWidget {
  final String? doctorName;
  final String? disease;
  final String? medicalCenter;
  final String? date;
  final String? time;

  const SearchResultsPage({
    super.key,
    this.doctorName,
    this.disease,
    this.medicalCenter,
    this.date,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    // Sample search results data
    final List<Map<String, dynamic>> searchResults = [
      {
        'doctor': 'Dr. Jane Smith',
        'specialty': 'Cardiologist',
        'medicalCenter': 'Heart Care Clinic',
        'availability': 'Available on September 1, 2024, at 10:00 AM',
        'rating': 4.5, // Sample rating
        'details':
            'Dr. Jane Smith is a highly experienced cardiologist with 15 years in the field...',
      },
      {
        'doctor': 'Dr. Robert Brown',
        'specialty': 'Neurologist',
        'medicalCenter': 'Neuro Health Center',
        'availability': 'Available on September 2, 2024, at 11:00 AM',
        'rating': 4.8, // Sample rating
        'details':
            'Dr. Robert Brown specializes in neurological disorders and has received numerous awards...',
      },
      // Add more sample results here
    ];

    // Filter the search results based on the search parameters
    final filteredResults = searchResults.where((result) {
      final matchesDoctorName =
          doctorName == null || result['doctor'].contains(doctorName!);
      final matchesDisease =
          disease == null || result['specialty'].contains(disease!);
      final matchesMedicalCenter = medicalCenter == null ||
          result['medicalCenter'].contains(medicalCenter!);
      return matchesDoctorName && matchesDisease && matchesMedicalCenter;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: filteredResults.length,
        itemBuilder: (context, index) {
          final result = filteredResults[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.black),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Doctor: ${result['doctor']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Specialty: ${result['specialty']}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Medical Center: ${result['medicalCenter']}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Availability: ${result['availability']}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700]),
                          const SizedBox(width: 4),
                          Text(
                            '${result['rating']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentPage(
                                doctorName: result['doctor'],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Make Appointment',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
