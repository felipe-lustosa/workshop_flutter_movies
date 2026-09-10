import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/movies/controller/movie_controller.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/grid_view.dart';
import 'package:signals/signals_hooks.dart';

class MoviesContent extends StatefulWidget {
  const MoviesContent({super.key}); 

  @override
  State<MoviesContent> createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {
  final _nameController = TextEditingController(text: '');
  final _emailController = TextEditingController(text: '');
  final _addressController = TextEditingController(text: '');
  final _movieController = getIt<MovieController>();

  void resetControllers() {
    _nameController.clear();
    _emailController.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    _movieController.showMovies();
    return Expanded(
      child: Container(
        // decoration: BoxDecoration(
        //     border: Border.all(),
        //     borderRadius: BorderRadius.circular(10)),
        child: SignalBuilder(
          builder: (context) => GridBuilder(
            onTap: (user) {
              // _controllerUser.text = user.name;
              // _controllerEmail.text = user.email;
              // _controllerAdress.text = user.adress;
            },
            movies: _movieController.moviesList,
          ),
        ),
      ),
    );
  }
}
