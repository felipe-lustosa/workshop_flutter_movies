import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String title;
  const CustomSnackbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(title),
      duration: const Duration(milliseconds: 3000),
      width: 280.0, // Width of the SnackBar.
      padding: const .symmetric(
        horizontal: 8.0, 
        vertical: 4.0
      ),
      behavior: .floating,
      shape: RoundedRectangleBorder(borderRadius: .circular(10.0)),
    );
  }
}