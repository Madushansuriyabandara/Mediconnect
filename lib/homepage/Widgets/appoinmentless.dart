// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// // Ensure cameras are initialized before the app starts
// // ignore: non_constant_identifier_names

// // ignore: non_constant_identifier_names

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   // Fetch the available cameras before initializing the app.
// //   final cameras = await availableCameras();
// //   final firstCamera = cameras.first;

// //   runApp(AppointmentLess(camera: firstCamera));
// // }

// // class AppointmentLess extends StatelessWidget {
// //   final CameraDescription camera;

// //   const AppointmentLess({super.key, required this.camera});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: NoAppointment(camera: camera),
// //     );
// //   }
// // }

// // class NoAppointment extends StatelessWidget {
// //   final CameraDescription camera;

// //   const NoAppointment({super.key, required this.camera});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('No Appointment')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             if (kDebugMode) {
// //               print('No Appointment button pressed!');
// //             }
// //             // Navigate to camera screen
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => CameraScreen(camera: camera),
// //               ),
// //             );
// //           },
// //           style: ElevatedButton.styleFrom(
// //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(24),
// //             ),
// //             backgroundColor: const Color.fromARGB(255, 74, 224, 79),
// //           ),
// //           child: const Text(
// //             "No Appointment",
// //             style: TextStyle(fontSize: 16, color: Colors.black),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class CameraScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const CameraScreen({super.key, required this.camera});

//   @override
//   CameraScreenState createState() => CameraScreenState();
// }

// class CameraScreenState extends State<CameraScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the camera controller
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.high,
//     );

//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // Dispose the camera controller when the screen is disposed
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Camera Preview')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview
//             return CameraPreview(_controller);
//           } else if (snapshot.hasError) {
//             // If there's an error, show a message
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             // Otherwise, show a loading indicator
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
