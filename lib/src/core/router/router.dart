

import 'package:go_router/go_router.dart';
import 'package:project_flca2/src/features/forms/ui/form_page.dart';
import 'package:project_flca2/src/features/login/ui/login_page.dart';

final router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => LoginPage()),
  GoRoute(path: "/movies", builder: (context, state) => FormPage()),
]);