import 'dart:typed_data';

import 'package:project_flca2/src/shared/proto/packages.pb.dart';

// Classe responsável por adaptar e decodificar mensagens protobuf relacionadas ao motor 
class EngineAdapter {

   // Método estático que decodifica uma mensagem protobuf do tipo Motor
  static Engine decodeProto(Uint8List encodedEngine){
    try{
      return Engine.fromBuffer(encodedEngine);
    }
    catch(e){
        // Lança uma exceção personalizada em caso de erro na decodificação
      throw Exception('Erro ao decodificar o proto');
    }
  }

  // Método estático que codifica uma instância de Motor em uma mensagem protobuf   
  static Uint8List encodeProto(Engine engine){
    return engine.writeToBuffer(); // Retorna o buffer de bytes codificado
  }
}


