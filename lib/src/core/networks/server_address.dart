import 'package:flutter_dotenv/flutter_dotenv.dart';

final address = dotenv.get('ADDRESS');
final port = dotenv.getInt('PORT');

final getEngineRoute = "$address:$port/get-engine";

final getUserRoute = "$address:$port/show-informations";
final postUserRoute = "$address:$port/update-informations";

final userToken = dotenv.get('TOKEN');