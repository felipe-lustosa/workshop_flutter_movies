import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/movies/data/datasources/movie_datasource.dart';
import 'package:project_flca2/src/features/movies/data/repositories/movie_repository.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';
import 'package:signals/signals.dart';

class MovieController {
  final _moviesList = signal<List<Movie>>([]);
  final _selectedMovie = signal<Movie?>(null);
  final _error = signal<String>('');

  List<Movie> get moviesList => _moviesList.value;
  Movie? get selectedMovie=> _selectedMovie.value;
  String get error => _error.value;
  final movieRepository = MovieRepository(MovieDatasource()); 

  Future<void> safeRun(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      _error.value = e.toString();
    }
  }

  void showMovies() async {
    await safeRun(() async {
      final result = await movieRepository.showInformations();
      _moviesList.value = result.movies;
    });
  }

  void selectMovie(Movie movie) {
    _selectedMovie.value = movie;
    router.go("/movie-details");
  }

  // void updateInformations(String moviesList, String email, String address) async {
  //   await safeRun(() async {
  //     final result = await userRepository.updateInformations(moviesList, email, address);

  //     if (result) {
  //       updateUserInformations(moviesList, email, address);
  //     }
  //   });
  // }

  // void clearInformations() async {
  //   await safeRun(() async {
  //     final result = await userRepository.updateInformations("", "", "");

  //     if (result) {
  //       updateUserInformations("", "", "");
  //     }
  //   });
  // }
}