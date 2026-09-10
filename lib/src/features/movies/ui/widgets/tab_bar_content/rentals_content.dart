import 'package:flutter/material.dart';
import 'package:project_flca2/src/features/movies/ui/movies_page.dart';

class RentalsContent extends StatefulWidget {
  const RentalsContent({super.key}); 

  @override
  State<RentalsContent> createState() => _RentalsContentState();
}

class _RentalsContentState extends State<RentalsContent> {
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _addressController = TextEditingController(text: '');
  // final _formController = getIt<FormController>();

  void resetControllers() {
    _nameController.clear();
    _emailController.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // _formController.showInformations();
    return Column();
  }
}
