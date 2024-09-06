import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    backgroundColor: Colors.blue,
  ));
}
