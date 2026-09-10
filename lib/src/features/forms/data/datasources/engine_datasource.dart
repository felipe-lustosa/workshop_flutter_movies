import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project_flca2/src/core/networks/server_address.dart';

class EngineDatasource {
  final http.Client client;

  EngineDatasource(this.client);
  // Método para recuperar o estado do motor na api
  Future<Uint8List> getEngine() async {
    try {
      // Faz uma requisição GET para o endpoint especificado
      final response = await client.get(Uri.parse(getEngineRoute), 
      headers: {'forms-client-token': userToken} // definido no serve_address.dart
      );

      // Retorna os bytes se a requisição foi bem-sucedida
      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\'t connet to server');
    }
  }
}
