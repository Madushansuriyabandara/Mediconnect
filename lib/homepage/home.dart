import 'package:flutter/material.dart';
import 'package:mediconnect/homepage/Widgets/addtodaysplanbutton.dart';
//import 'package:mediconnect/homepage/Widgets/appoinmentless.dart';
import 'package:mediconnect/homepage/Widgets/nextpatent.dart';
import 'package:mediconnect/homepage/Widgets/todaytaskcontainer.dart';
//import 'package:camera/camera.dart';
import 'Widgets/viewdrop.dart';
import 'Widgets/confrimbutton.dart';
import 'Widgets/available.dart';
import 'Widgets/line.dart';
import 'Widgets/numofpatient.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _currentLocation = "maharagama"; // Ensure this is set to a valid initial value if needed

  void _updateLocation(String? newLocation) {
    setState(() {
      _currentLocation = newLocation ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 0, left: 16.0, right: 18.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hello\nDr. Smith",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, height: 1),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "I'm now in ",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 6),
                        MyDropdownButton(
                          initialLocation: _currentLocation,
                          onChanged: _updateLocation,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 150),
                        confrim(_currentLocation),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            available(),
            const SizedBox(height: 10),
            line(Colors.grey, 200.0, 5.0),
            const SizedBox(height: 10),
            const Nextpatent(),
            const SizedBox(height: 5),
            // ElevatedButton(
            //   onPressed: () async {
                // final cameras = await availableCameras();
                // final firstCamera = cameras.first;

                // Navigator.push(
                //   // ignore: use_build_context_synchronously
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => CameraScreen(camera: firstCamera),
                //   ),
                // );
              //},
            //   child: const Text("Appointment Less"),
            // ),
            // const SizedBox(height: 5),
            numberofpatient(),
            const SizedBox(height: 0),
            line(Colors.black, 400.0, 8.0),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Plan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const TodayTaskContainer(confirmButtonStatus: false),
            const AddTodaysTask(),
          ],
        ),
      ),
    );
  }
}
