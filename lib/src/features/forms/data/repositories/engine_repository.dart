import 'package:project_flca2/src/features/forms/data/adapters/engine_adapter.dart';
import 'package:project_flca2/src/features/forms/data/datasources/engine_datasource.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';

class EngineRepository {
  final EngineDatasource engineDatasource;

  EngineRepository(this.engineDatasource);

  Future<Engine> getEngine() async {
    try {
      final bytesEngine = await engineDatasource.getEngine();
      return EngineAdapter.decodeProto(bytesEngine);
    } catch (e) {
      throw Exception('Failed to get engine: $e');
    }
  }
}
