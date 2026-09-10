import 'dart:typed_data';

import 'package:project_flca2/src/shared/proto/packages.pb.dart';


class UserAdapter {

   // Método estático que decodifica uma mensagem protobuf do tipo User
  static User decodeProto(Uint8List encodedUser){
    try{
      return User.fromBuffer(encodedUser);
    }
    catch(e){
        // Lança uma exceção personalizada em caso de erro na decodificação
      throw Exception('Erro ao decodificar o proto');
    }
  }

  // Método estático que codifica uma instância de User em uma mensagem protobuf   
  static Uint8List encodeProto(User user){
    return user.writeToBuffer(); // Retorna o buffer de bytes codificado
  }
}


