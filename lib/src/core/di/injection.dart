import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/features/login/data/repositories/login_repository.dart';
import 'package:project_flca2/src/features/movies/controller/available_movies_controller.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';
import 'package:project_flca2/src/features/movies/controller/rental_movies_controller.dart';
import 'package:project_flca2/src/features/movies/data/datasources/movie_datasource.dart';
import 'package:project_flca2/src/features/movies/data/repositories/movie_repository.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => http.Client());

  getIt.registerFactory(() => LoginDatasource());
  getIt.registerFactory<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerSingleton<LoginController>(LoginController());

  getIt.registerFactory(() => MovieDatasource());
  getIt.registerFactory<MovieRepository>(() => MovieRepository(getIt()));
  getIt.registerSingleton<AvailableMoviesController>(AvailableMoviesController());
  getIt.registerSingleton<RentalMoviesController>(RentalMoviesController());
}