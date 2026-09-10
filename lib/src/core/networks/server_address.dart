import 'package:flutter_dotenv/flutter_dotenv.dart';

final address = dotenv.get('ADDRESS');
final port = dotenv.getInt('PORT');

final loginRoute = "$address:$port/login";

final getMoviesRoute = "$address:$port/available-movies";
final rentalMovieRoute = "$address:$port/rental-movie";
final getRentalUserRoute = "$address:$port/movies-rental-by-user";
final removeRentalRoute = "$address:$port/watch-movie";

final userToken = dotenv.get('TOKEN');