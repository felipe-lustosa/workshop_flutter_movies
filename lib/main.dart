import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/core/router/router.dart';

void main() async {
  await dotenv.load();
  configureDependencies();
  runApp(const RouterWidget());
}

class RouterWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Meu App"
    );
  }
}