import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final Function onSubmit;
  final TextEditingController controller;
  const new({super.key, required this.label, required this.obscureText, required this.onSubmit, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, 
      obscureText: obscureText,
      onSubmitted: (value) => onSubmit(),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Colors.white)), 
        label: Text(label),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.white, width: 2.0), // Slightly thicker when focused
        ),
      ), 
      style: TextStyle(
        color: Colors.white
      ),
    );
  }
}