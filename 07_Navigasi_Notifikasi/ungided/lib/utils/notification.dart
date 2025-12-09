import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showTopNotification(
  BuildContext context, {
  required String title,
  required String message,
  Color color = Colors.green,
  IconData icon = Icons.check_circle,
}) {
  Flushbar(
    title: title,
    message: message,
    backgroundColor: color,
    icon: Icon(icon, color: Colors.white),
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(12),
    borderRadius: BorderRadius.circular(12),
    flushbarPosition: FlushbarPosition.TOP,
  ).show(context);
}
