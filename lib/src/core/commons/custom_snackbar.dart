import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.red,
  Duration duration = const Duration(seconds: 3),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
