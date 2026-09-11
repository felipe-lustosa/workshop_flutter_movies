import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project_flca2/src/core/networks/server_address.dart';

class LoginDatasource {
  final client = http.Client();

  Future<(Uint8List?, String?)> login(Uint8List userBytes) async {
    try {
      var uri = Uri.parse(loginRoute);
      var response = await client.post(
        uri,
        body: userBytes,
        headers: {'Content-Type': 'application/x-protobuf'},
      );
     
      if (response.statusCode == 401) {
        return (null, 'Username or password invalid');
      }
     
      return (response.bodyBytes, null);
    } on Exception {
      return (null, 'Was not possible connect to server');
    }
  }
}
