
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

  // Future<bool> updateInformations(String name, String email, String address) async {
  //   try {
  //     final userData = Movie(
  //       name: name,
  //       email: email,
  //       address: address,
  //     );
  //     final encodedMovie = MovieAdapter.encodeProto(userData);

  //     final hasUpdated = await movieDatasource.postInformations(encodedMovie);
  //     return hasUpdated;
  //   } catch (e) {
  //     throw Exception('Failed to update user: $e');
  //   }
  // }
}
