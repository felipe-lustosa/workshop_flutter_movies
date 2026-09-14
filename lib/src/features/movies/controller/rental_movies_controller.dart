import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';
import 'package:project_flca2/src/features/movies/data/datasources/movie_datasource.dart';
import 'package:project_flca2/src/features/movies/data/repositories/movie_repository.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';
import 'package:signals/signals.dart';

class RentalMoviesController {
  final _rentalMoviesList = signal<List<Movie>>([]);
  final _error = signal<String?>(null);

  List<Movie> get rentalMoviesList => _rentalMoviesList.value;
  String? get error => _error.value;

  final movieRepository = MovieRepository(MovieDatasource()); 
  final loginController = getIt<LoginController>();

  Future<void> safeRun(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      _error.value = e.toString();
    }
  }

  void showRentalMovies() async {
    await safeRun(() async {
      try {
        final result = await movieRepository.showRentalInformations(loginController.userData!);
        _rentalMoviesList.value = result.movies;
      } catch(e) {
        _rentalMoviesList.value = [];
      }
    });
  }

  Future<void> rentalMovie(int movieId) async {
    await safeRun(() async {
      if (rentalMoviesList.any((movie) => movie.id == movieId)) {
        throw Exception("Esse filme já foi alugado!");
      }

      final result = await movieRepository.rentalMovie(movieId, loginController.userData!.id);

      if (result) {
        router.go("/movies");
      }
    });
  }

  Future<void> watchMovie(int movieId) async {
    await safeRun(() async {
      final result = await movieRepository.watchMovie(movieId, loginController.userData!.id);

      if (result) {
        router.go("/movies");
        showRentalMovies();
      }
    });
  }

  void resetError()  {
    _error.value = '';
  }
}