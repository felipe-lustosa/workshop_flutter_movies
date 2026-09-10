import 'package:project_flca2/src/features/forms/data/adapters/user_adapter.dart';
import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';

class LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepository(this.loginDatasource);

  Future<bool> login(String username, String password) async {
    try {
      final userData = User(
        username: username,
        password: password,
      );
      final encodedUser = UserAdapter.encodeProto(userData);

      // final hasUpdated = await LoginDatasource.login(encodedUser);
      return true;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
