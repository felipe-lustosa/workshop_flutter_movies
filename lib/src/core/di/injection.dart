import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_flca2/src/features/forms/controller/form_controller.dart';
import 'package:project_flca2/src/features/forms/data/datasources/engine_datasource.dart';
// import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory(() => http.Client());
  getIt.registerFactory(() => EngineDatasource(getIt()));
  // getIt.registerFactory(() => LoginDatasource());

  getIt.registerSingleton<FormController>(FormController());
}