
import 'package:project_flca2/src/features/login/data/adapters/login_adapter.dart';
import 'package:project_flca2/src/features/movies/data/adapters/movie_adapter.dart';
import 'package:project_flca2/src/features/movies/data/datasources/movie_datasource.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';

class MovieRepository {
  final MovieDatasource movieDatasource;

  MovieRepository(this.movieDatasource);

  Future<Movies> showInformations() async {
    try {
      final bytesMovie = await movieDatasource.getMovies();
      if (bytesMovie.isEmpty) {
        throw("Os bytes de user estão vazios.");
      }
      return MoviesAdapter.decodeProto(bytesMovie);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future<Movies> showRentalInformations(User user) async {
    try {
      final rentalData = User(
        id: user.id,
        username: user.username,
        password: user.password,
      );
      final encodedMovie = LoginAdapter.encodeProto(rentalData);
      final bytesMovie = await movieDatasource.getRentalMovies(encodedMovie);

      if (bytesMovie.isEmpty) {
        throw("Os bytes de user estão vazios.");
      }
      return MoviesAdapter.decodeProto(bytesMovie);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future<bool> rentalMovie(int movieId, int userId) async {
    try {
      final rentalData = Rental(
        movieId: movieId,
        userId: userId,
      );
      final encodedMovie = RentalAdapter.encodeProto(rentalData);

      final hasUpdated = await movieDatasource.postRentalMovie(encodedMovie);
      return hasUpdated;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<bool> watchMovie(int movieId, int userId) async {
    try {
      final rentalData = Rental(
        movieId: movieId,
        userId: userId,
      );
      final encodedMovie = RentalAdapter.encodeProto(rentalData);

      final hasUpdated = await movieDatasource.postWatchMovie(encodedMovie);
      return hasUpdated;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
