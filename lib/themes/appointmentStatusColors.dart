import 'package:flutter/material.dart';

class StatusColors {
  static Color getStatusColor(String status) {
    switch (status) {
      case "Queued":
        return Colors.yellow;
      case "Upcoming":
        return Colors.green;
      case "Overdue":
        return Colors.red;
      case "Waiting to Rate":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
