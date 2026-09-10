import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/forms/controller/form_controller.dart';
import 'package:project_flca2/src/features/login/ui/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _formController = getIt<FormController>();


  void resetControllers() {
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Workshop Flutter'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: Image(
              image: AssetImage('assets/image.png'),
              repeat: ImageRepeat.repeat,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 500,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      spacing: 32,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Entrar", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600), textAlign: TextAlign.left,),
                          ],
                        ),
                        CustomTextField(label: "Username", controller: _usernameController),
                        CustomTextField(label: "Password", controller: _passwordController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => {
                                resetControllers(),
                              }, 
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                              ),
                              // style: ButtonStyle(textStyle: WidgetStateMapper()),
                              child: Text("Esqueceu a senha?"),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => {
                          // _formController.updateInformations(
                          //   _nameController.text,
                          //   _emailController.text,
                          //   _addressController.text,
                          // ),
                          resetControllers()
                          }, 
                          style: ButtonStyle(  
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.only(left: 64, right: 64),
                            ),
                          ),
                          child: Text("Entrar")
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ]
      ),
    );
  }
}