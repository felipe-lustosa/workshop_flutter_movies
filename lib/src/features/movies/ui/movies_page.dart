import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';
import 'package:project_flca2/src/features/movies/controller/available_movies_controller.dart';
import 'package:project_flca2/src/features/movies/controller/rental_movies_controller.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/tab_bar_content/movies_content.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/tab_bar_content/rentals_content.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});
  final _loginController = getIt<LoginController>();
  final _movieController = getIt<AvailableMoviesController>();
  final _rentalMovieController = getIt<RentalMoviesController>();

  @override
  Widget build(BuildContext context) {
    _movieController.showMovies();
    _rentalMovieController.showRentalMovies();
    
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 11, 63),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 15, 172),
          title:
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.person),
                        onPressed: () => {},
                      ),
                    ),
                    Text(_loginController.userData!.username, style: TextStyle(color: Colors.white),),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () => _loginController.logout(),
                ),
              ],
            ),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(text: "Available Movies"),
              Tab(text: "Movies Rental"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MoviesContent(),
            RentalsContent(),
          ],
        ),
      ),
    );
  }
}
