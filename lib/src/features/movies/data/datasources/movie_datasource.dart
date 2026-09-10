import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:project_flca2/src/core/networks/server_address.dart';

class MovieDatasource {
  final client = http.Client();

  Future<Uint8List> getMovies() async {
    try {
      final response = await client.get(
        Uri.parse(getMoviesRoute), 
        headers: {
          'Content-Type': 'application/x-protobuf',
          'X-Student-Token': userToken, // <-- Token adicionado
        },
      );

      return response.bodyBytes;
    } catch (e) {
      throw Exception('Can\'t connet to server');
    }
  }
  
  // Future<bool> postInformations(Uint8List encodedMovie) async {
  //   try {
  //     final response = await client.post(
  //       Uri.parse(postMovieRoute),
  //       body: encodedMovie, 
  //       headers: {'forms-client-token': userToken} // definido no serve_address.dart
  //     );

  //     // Retorna true se a requisição foi bem-sucedida
  //     if (response.statusCode == 200) {
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     throw Exception('Can\'t connet to server');
  //   }
  // }
}
