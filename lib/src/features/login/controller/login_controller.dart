import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/features/login/data/repositories/login_repository.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';
import 'package:signals/signals.dart';

class LoginController {
  final _username = signal<String>('');
  final _password = signal<String>('');
  final _userData = signal<User?>(null);
  final _error = signal<String?>('');

  String get username => _username.value;
  String get password => _password.value;
  User? get userData => _userData.value;
  String? get error => _error.value;

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

      _userData.value = result;
      if (userData != null) {
        router.go("/movies");
      }
    });
  }

  void logout()  {
    _error.value = null;
    _userData.value = null;
    router.go("/");
  }
}