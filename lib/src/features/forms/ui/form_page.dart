import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/forms/controller/form_controller.dart';
import 'package:project_flca2/src/features/forms/ui/widgets/custom_info_field.dart';
import 'package:signals/signals_flutter.dart';

class FormPage extends StatefulWidget {
  const new({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _addressController = TextEditingController(text: '');
  final _formController = getIt<FormController>();


  void resetControllers() {
    _nameController.clear();
    _emailController.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // _formController.showInformations();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Formulário')
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Image(
              image: AssetImage('assets/image.jpg'),
              repeat: ImageRepeat.repeat,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                SignalBuilder(
                  builder: (context) {
                    return Text(_formController.error, style: TextStyle(color: Colors.red));
                  }
                ),
                // CustomTextField(label: "Name", controller: _nameController),
                // CustomTextField(label: "Email", controller: _emailController),
                // CustomTextField(label: "Address", controller: _addressController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    OutlinedButton(onPressed: () => {
                      resetControllers(),
                      // _formController.clearInformations()
                    }, child: Text("Cancel")),
                    ElevatedButton(onPressed: () => {
                      // _formController.updateInformations(
                      //   _nameController.text,
                      //   _emailController.text,
                      //   _addressController.text,
                      // ),
                      resetControllers()
                    }, child: Text("Confirm")),
                  ],
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      spacing: 8,
                      children: [
                        Text("Dados"),
                        SignalBuilder(
                          builder: (context) {
                            return CustomInfoField(title: "Nome", label: _formController.name);
                          }
                        ),
                        SignalBuilder(
                          builder: (context) {
                            return CustomInfoField(title: "E-mail", label: _formController.email);
                          }
                        ),
                        SignalBuilder(
                          builder: (context) {
                            return CustomInfoField(title: "Address", label: _formController.address);
                          }
                        ),
                      ],
                    ),
                  ),
                )
              ]
            ),
          ),
        ]
      ),
    );
  }
}