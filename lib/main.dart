import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
import 'screens/patientScreens/homeScreen/home.dart'; // Import the home.dart file
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'screens/doctorScreens/doctorRegistrationScreen.dart'; // Import Doctor Registration Screen
import 'screens/patientScreens/patientRegistrationScreen.dart'; // Import Patient Registration Screen
import 'screens/startScreens/login.dart'; // Import Login Screen
import 'screens/startScreens/welcome.dart'; // Import Welcome Screen

void main() {
  runApp(MyApp());
  /*runApp(DevicePreview(
    enabled: !kReleaseMode &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS),
    builder: (context) => const MyApp(),
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*Future<void> _checkSession(BuildContext context) async {
    final currentDeviceId = await MobileDeviceIdentifier().getDeviceId();
    const storedDeviceId = ''; // Retrieve this from local storage

    if (currentDeviceId == storedDeviceId) {
      // Directly go to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      // Redirect to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder,
      title: 'Mediconnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _checkSession(context),
        builder: (context, snapshot) {
          return GetStartedScreen(); // Initial screen before session check
        },
      ),
      routes: {
        '/doctorRegistration': (context) => DoctorRegistrationScreen(),
        '/patientRegistration': (context) => PatientRegistrationForm(),
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
