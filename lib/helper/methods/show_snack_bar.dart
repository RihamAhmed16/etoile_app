import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context, String errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 3),
    ),
  );
}