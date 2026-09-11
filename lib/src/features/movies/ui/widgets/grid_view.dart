import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:project_flca2/src/shared/proto/packages.pb.dart';

class GridBuilder extends StatefulWidget {
  const GridBuilder({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.movies,
  });

  final void Function(Movie movie)? onTap;
  final void Function()? onLongPress;
  final List<Movie> movies;

  @override
  GridBuilderState createState() => GridBuilderState();
}

class GridBuilderState extends State<GridBuilder> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.movies.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      itemBuilder: (_, int index) {
        final movie = widget.movies[index];
        return InkWell(
          onTap: () => widget.onTap?.call(movie),
          onLongPress: () => widget.onLongPress?.call(),
          child: GridTile(
            child: Container(
              margin: EdgeInsets.all(4.0),
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.memory(Uint8List.fromList(movie.cover), height: 120),
                  Text('R\$ ${movie.value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontWeight: FontWeight(600)),)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
