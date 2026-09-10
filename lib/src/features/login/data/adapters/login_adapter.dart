import 'dart:typed_data';

import 'package:project_flca2/src/shared/proto/packages.pb.dart';

class LoginAdapter {

   // Método estático que decodifica uma mensagem protobuf do tipo Login
  static User decodeProto(Uint8List encodedLogin){
    try{
      return User.fromBuffer(encodedLogin);
    }
    catch(e){
        // Lança uma exceção personalizada em caso de erro na decodificação
      throw Exception('Erro ao decodificar o proto');
    }
  }

  // Método estático que codifica uma instância de Login em uma mensagem protobuf   
  static Uint8List encodeProto(User user){
    return user.writeToBuffer(); // Retorna o buffer de bytes codificado
  }
}


