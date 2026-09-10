import 'package:flutter_dotenv/flutter_dotenv.dart';

final address = dotenv.get('ADDRESS');
final port = dotenv.getInt('PORT');

final loginRoute = "$address:$port/login";

final userToken = dotenv.get('TOKEN');