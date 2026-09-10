import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/features/login/data/repositories/login_repository.dart';
import 'package:signals/signals.dart';

class FormController {
  final _username = signal<String>('');
  final _password = signal<String>('');
  final _error = signal<String>('');
  final _itens = signal<List<String>>([]);

  String get username => _username.value;
  String get password => _password.value;
  String get error => _error.value;
  List <String> get itens => _itens.value;

  late final totalItens = computed(() => _itens.value.length);
  final loginRepository = LoginRepository(LoginDatasource()); 

  void updateUserInformations(String username, String password, String address) {
    batch(() {
      _username.value = username;
      _password.value = password;
    });
  }

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

      if (result) {
        // ignore: avoid_print
        print(result);
        // updateUserInformations(username, password);
      }
    });
  }
}