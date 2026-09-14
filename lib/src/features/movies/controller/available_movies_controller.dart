import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';
import 'package:project_flca2/src/features/movies/data/datasources/movie_datasource.dart';
import 'package:project_flca2/src/features/movies/data/repositories/movie_repository.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';
import 'package:signals/signals.dart';

class AvailableMoviesController {
  final _moviesList = signal<List<Movie>>([]);
  final _selectedMovie = signal<Movie?>(null);
  final _isRental = signal<bool>(false);
  final _error = signal<String>('');

  List<Movie> get moviesList => _moviesList.value;
  Movie? get selectedMovie=> _selectedMovie.value;
  bool get isRental=> _isRental.value;
  String get error => _error.value;

  final movieRepository = MovieRepository(MovieDatasource()); 
  final loginController = getIt<LoginController>();

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

  void selectMovie(Movie movie, {bool isRental = false}) {
    _selectedMovie.value = movie;
    _isRental.value = isRental;
    router.go("/movie-details");
  }
}