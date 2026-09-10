import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/features/login/data/repositories/login_repository.dart';
import 'package:signals/signals.dart';

class LoginController {
  final _username = signal<String>('');
  final _password = signal<String>('');
  final _userId = signal<int?>(null);
  final _error = signal<String>('');

  String get username => _username.value;
  String get password => _password.value;
  int? get userId => _userId.value;
  String get error => _error.value;

  final loginRepository = LoginRepository(LoginDatasource()); 

  Future<void> safeRun(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      _error.value = e.toString();
    }
  }

  void login(String username, String password) async {
    await safeRun(() async {
      final result = await loginRepository.login(username, password);

      print(result);
      _userId.value = result.id;
      if (userId is int) {
        router.go("/movies");
      }
    });
  }
}