import 'dart:typed_data';

import 'package:project_flca2/src/shared/proto/packages.pb.dart';


class MovieAdapter {
   // Método estático que decodifica uma mensagem protobuf do tipo Movie
  static Movie decodeProto(Uint8List encodedMovie){
    try{
      return Movie.fromBuffer(encodedMovie);
    }
    catch(e){
        // Lança uma exceção personalizada em caso de erro na decodificação
      throw Exception('Erro ao decodificar o proto');
    }
  }

  // Método estático que codifica uma instância de Movie em uma mensagem protobuf   
  static Uint8List encodeProto(Movie user){
    return user.writeToBuffer(); // Retorna o buffer de bytes codificado
  }
}

class MoviesAdapter {
   // Método estático que decodifica uma mensagem protobuf do tipo Movie
  static Movies decodeProto(Uint8List encodedMovies){
    try{
      return Movies.fromBuffer(encodedMovies);
    }
    catch(e){
        // Lança uma exceção personalizada em caso de erro na decodificação
      throw Exception('Erro ao decodificar o proto');
    }
  }

  // Método estático que codifica uma instância de Movies em uma mensagem protobuf   
  static Uint8List encodeProto(Movies user){
    return user.writeToBuffer(); // Retorna o buffer de bytes codificado
  }
}


