import 'package:project_flca2/src/features/forms/data/adapters/user_adapter.dart';
import 'package:project_flca2/src/features/forms/data/datasources/user_datasource.dart';
import 'package:project_flca2/src/shared/proto/form_pkg.pb.dart';

class UserRepository {
  final UserDatasource userDatasource;

  UserRepository(this.userDatasource);

  Future<User> showInformations() async {
    try {
      final bytesUser = await userDatasource.getInformations();
      if (bytesUser.isEmpty) {
        throw("Os bytes de user estão vazios.");
      }
      return UserAdapter.decodeProto(bytesUser);
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future<bool> updateInformations(String name, String email, String address) async {
    try {
      final userData = User(
        name: name,
        email: email,
        address: address,
      );
      final encodedUser = UserAdapter.encodeProto(userData);

      final hasUpdated = await userDatasource.postInformations(encodedUser);
      return hasUpdated;
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }
}
