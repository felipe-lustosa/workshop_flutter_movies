import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';
import 'package:project_flca2/src/features/login/ui/widgets/alert_modal.dart';
import 'package:project_flca2/src/features/login/ui/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');
  final _loginController = getIt<LoginController>();


  void resetControllers() {
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    
    void handleLogin() async {
      await _loginController.login(_usernameController.text, _passwordController.text);

      if (_loginController.error is String) {
        showErrorAlert(
          // ignore: use_build_context_synchronously
          context, 
          _loginController.error!, 
          () => _loginController.cleanErrors(),
        );
      }
    }

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
            child: Image(image: AssetImage('assets/image.png'), repeat: ImageRepeat.repeat, width: double.maxFinite, height: double.maxFinite),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 15, 172), 
                      borderRadius: BorderRadius.circular(8.0)
                    ),
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
                        CustomTextField(label: "Username", obscureText: false, controller: _usernameController, onSubmit: handleLogin),
                        CustomTextField(label: "Password", obscureText: true, controller: _passwordController, onSubmit: handleLogin),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: () => {resetControllers(),}, style: TextButton.styleFrom(foregroundColor: Colors.white,),
                              child: Text("Esqueceu a senha?"),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => handleLogin(),
                          child: const Text('Entrar'),
                        )

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