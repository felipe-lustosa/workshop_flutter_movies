import 'package:project_flca2/src/features/forms/data/adapters/user_adapter.dart';
import 'package:project_flca2/src/features/forms/data/datasources/user_datasource.dart';
import 'package:project_flca2/src/features/login/data/datasources/login_datasource.dart';
import 'package:project_flca2/src/shared/proto/form_pkg.pb.dart';

class UserRepository {
  final UserDatasource userDatasource;

  UserRepository(this.userDatasource);

  Future<bool> login(String name, String email, String address) async {
    try {
      final userData = User(
        name: name,
        email: email,
        address: address,
      );
      final encodedUser = UserAdapter.encodeProto(userData);

      final hasUpdated = await LoginDatasource.login(encodedUser);
      return true;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
