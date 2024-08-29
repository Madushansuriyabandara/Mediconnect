import 'package:flutter/material.dart';

Color getAppointmentStatusColor(String appointmentStatus) {
  switch (appointmentStatus) {
    case 'Queued':
      return const Color.fromARGB(255, 117, 184, 239);
    case 'Completed':
      return Color.fromARGB(255, 99, 192, 102);
    case 'Missed':
      return Color.fromARGB(255, 244, 117, 108);
    case 'Upcoming':
      return Color.fromARGB(210, 210, 227, 252);
    default:
      return Colors.grey;
  }
}
