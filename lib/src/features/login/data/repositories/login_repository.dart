import 'package:project_flca2/src/features/login/data/adapters/login_adapter.dart';
import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';

class LoginRepository {
  final LoginDatasource loginDatasource;

  LoginRepository(this.loginDatasource);

  Future<User> login(String username, String password) async {
    try {
      final userData = User(
        username: username,
        password: password,
        id: 950
      );
      final encodedUser = LoginAdapter.encodeProto(userData);

      final loginData = await loginDatasource.login(encodedUser);
      final baseLogin = LoginAdapter.decodeProto(loginData.$1!);
      return baseLogin;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
