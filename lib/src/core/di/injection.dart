import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_flca2/src/features/movies/controller/movie_controller.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => http.Client());
  // getIt.registerFactory(() => EngineDatasource(getIt()));
  // getIt.registerFactory(() => LoginDatasource());

  getIt.registerSingleton<LoginController>(LoginController());
  getIt.registerSingleton<MovieController>(MovieController());
}