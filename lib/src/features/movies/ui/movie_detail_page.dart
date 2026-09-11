import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/di/injection.dart';
import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/movies/controller/movie_controller.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key}); 

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _movieController = getIt<MovieController>();

  @override
  Widget build(BuildContext context) {
    final movie = _movieController.selectedMovie;

    if (movie == null) {
      router.go("/movies");
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => router.go("/"),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsetsGeometry.all(16),
        padding: EdgeInsetsGeometry.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white), 
          borderRadius: BorderRadius.circular(8.0)
        ),
        height: double.maxFinite,
        child: (
          Row(
            spacing: 12,
            children: [
              Column(
                children: [
                Image.memory(Uint8List.fromList(movie!.cover), height: 120,),
                Text('R\$ ${movie.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight(600)),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          movie.sinopse,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        spacing: 24,
                        children: [
                          Text(movie.year, style: TextStyle(color: Colors.white)),
                          Text(movie.director, style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        spacing: 24,
                        children: [
                          ElevatedButton(onPressed: () => {}, child: Text("Cancel")),
                          ElevatedButton(onPressed: () => {}, child: Text("Rental"))
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        )
      ),
    );
  }
}
