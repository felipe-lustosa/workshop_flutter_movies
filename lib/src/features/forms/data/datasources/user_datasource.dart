import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project_flca2/src/core/networks/server_address.dart';

class UserDatasource {
  final client = http.Client();

  // Método para recuperar o estado do motor na api
  Future<Uint8List> getInformations() async {
    try {
      // Faz uma requisição GET para o endpoint especificado
      final response = await client.get(Uri.parse(getUserRoute), 
      headers: {'forms-client-token': userToken} // definido no serve_address.dart
      );

      // Retorna os bytes se a requisição foi bem-sucedida
      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\'t connet to server');
    }
  }
  
  Future<bool> postInformations(Uint8List encodedUser) async {
    try {
      final response = await client.post(
        Uri.parse(postUserRoute),
        body: encodedUser, 
        headers: {'forms-client-token': userToken} // definido no serve_address.dart
      );

      // Retorna true se a requisição foi bem-sucedida
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Can\'t connet to server');
    }
  }
}
