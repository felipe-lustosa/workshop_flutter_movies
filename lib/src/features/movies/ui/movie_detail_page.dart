import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/login/controller/login_controller.dart';
import 'package:project_flca2/src/features/movies/controller/movie_controller.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key}); 

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _movieController = getIt<MovieController>();
  final _loginController = getIt<LoginController>();

  @override
  Widget build(BuildContext context) {
    final movie = _movieController.selectedMovie;

    if (movie == null) {
      router.go("/movies");
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 11, 63),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 106, 15, 172),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.memory(
                    Uint8List.fromList(movie!.cover), 
                    width: 300,
                    height: 450,
                    fit: BoxFit.cover
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'R\$ ${movie.value.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        movie.title,
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.sinopse,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    const Spacer(), // pushes the rest to the bottom
                    Row(
                      children: [
                        _InfoItem(label: 'Year', value: movie.year),
                        SizedBox(width: 30),
                        _InfoItem(label: 'Director', value: movie.director),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () => router.go("/movies"),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () => _movieController.isRental ? 
                          _movieController.watchMovie(movie.id, _loginController.userData!.id) : 
                          _movieController.rentalMovie(movie.id, _loginController.userData!.id),
                          child: _movieController.isRental ? Text('Watch') : Text('Rental'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const _InfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 11)),
      ],
    );
  }
}