import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const new({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller, 
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)), label: Text(label), ), 
    );
  }
}