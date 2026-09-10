

import 'package:go_router/go_router.dart';
import 'package:project_flca2/src/features/movies/ui/movies_page.dart';

final router = GoRouter(routes: [
  // GoRoute(path: "/", builder: (context, state) => LoginPage()),
  GoRoute(path: "/", builder: (context, state) => MoviesPage()),
]);