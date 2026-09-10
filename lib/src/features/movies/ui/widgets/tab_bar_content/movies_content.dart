import 'package:flutter/material.dart';
import 'package:project_flca2/src/features/movies/ui/movies_page.dart';

class MoviesContent extends StatefulWidget {
  const MoviesContent({super.key}); 

  @override
  State<MoviesContent> createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {
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
