

import 'package:go_router/go_router.dart';
import 'package:project_flca2/src/features/movies/ui/movie_detail_page.dart';
import 'package:project_flca2/src/features/movies/ui/movies_page.dart';

final router = GoRouter(routes: [
  // GoRoute(path: "/", builder: (context, state) => LoginPage()),
  GoRoute(path: "/", builder: (context, state) => MoviesPage()),
  // GoRoute(path: "/movies", builder: (context, state) => MoviesPage()),
  GoRoute(path: "/movie-details", builder: (context, state) => MovieDetailPage()),
]);