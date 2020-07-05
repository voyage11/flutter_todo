import 'package:flutter/material.dart';
import 'package:edge_alert/edge_alert.dart';

enum MessageType { error, success, warning }

mixin AppMessage {
  static void show(
      {BuildContext context,
      String title,
      String description,
      MessageType type}) {
    IconData icon = Icons.error;
    Color color = Colors.red;
    if (type == MessageType.success) {
      icon = Icons.check_circle;
      color = Colors.green;
    } else if (type == MessageType.warning) {
      icon = Icons.warning;
      color = Colors.yellow[800];
    }

    EdgeAlert.show(
      context,
      title: title,
      description: description,
      icon: icon,
      backgroundColor: color,
    );
  }
}
