import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/movies/controller/available_movies_controller.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/grid_view.dart';
import 'package:signals/signals_hooks.dart';

class MoviesContent extends StatefulWidget {
  const MoviesContent({super.key}); 

  @override
  State<MoviesContent> createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {
  final _movieController = getIt<AvailableMoviesController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SignalBuilder(
        builder: (context) => GridBuilder(
          onTap: (movie) {
            _movieController.selectMovie(movie, isRental: false);
          },
          movies: _movieController.moviesList,
        ),
      ),
    );
  }
}
