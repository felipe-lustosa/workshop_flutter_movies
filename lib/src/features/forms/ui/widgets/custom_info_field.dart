import 'package:flutter/material.dart';

class CustomInfoField extends StatelessWidget {
  final String title;
  final String label;
  const new({super.key, required this.title, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$title: "),
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      ]
    );
  }
}