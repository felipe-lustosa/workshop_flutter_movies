import 'package:project_flca2/src/features/forms/data/datasources/user_datasource.dart';
import 'package:project_flca2/src/features/forms/data/repositories/user_repository.dart';
import 'package:signals/signals.dart';

class FormController {
  final _name = signal<String>('');
  final _email = signal<String>('');
  final _address = signal<String>('');
  final _error = signal<String>('');
  final _itens = signal<List<String>>([]);

  String get name => _name.value;
  String get email => _email.value;
  String get address => _address.value;
  String get error => _error.value;
  List <String> get itens => _itens.value;

  late final totalItens = computed(() => _itens.value.length);
  // final userRepository = UserRepository(UserDatasource()); 

  void updateUserInformations(String name, String email, String address) {
    batch(() {
      _name.value = name;
      _email.value = email;
      _address.value = address;
    });
  }

  Future<void> safeRun(Future<void> Function() action) async {
    try {
      await action();
    } catch (e) {
      _error.value = e.toString();
    }
  }

  // void showInformations() async {
  //   await safeRun(() async {
  //     final result = await userRepository.showInformations();
  //     updateUserInformations(result.name, result.email, result.address);
  //   });
  // }

  // void updateInformations(String name, String email, String address) async {
  //   await safeRun(() async {
  //     final result = await userRepository.updateInformations(name, email, address);

  //     if (result) {
  //       updateUserInformations(name, email, address);
  //     }
  //   });
  // }

  // void clearInformations() async {
  //   await safeRun(() async {
  //     final result = await userRepository.updateInformations("", "", "");

  //     if (result) {
  //       updateUserInformations("", "", "");
  //     }
  //   });
  // }
}