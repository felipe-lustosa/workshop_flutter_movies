import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/movies/controller/available_movies_controller.dart';
import 'package:project_flca2/src/features/movies/controller/rental_movies_controller.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/grid_view.dart';
import 'package:signals/signals_hooks.dart';

class RentalsContent extends StatefulWidget {
  const RentalsContent({super.key}); 

  @override
  State<RentalsContent> createState() => _RentalsContentState();
}

class _RentalsContentState extends State<RentalsContent> {
  final _rentalMovieController = getIt<RentalMoviesController>();
  final _movieController = getIt<AvailableMoviesController>();

  @override
  Widget build(BuildContext context) {
    _rentalMovieController.showRentalMovies();
    return Expanded(
      child: SignalBuilder(
        builder: (context) => GridBuilder(
          onTap: (movie) {
            _movieController.selectMovie(movie, isRental: true);
          },
          movies: _rentalMovieController.rentalMoviesList,
        ),
      ),
    );
  }
}
