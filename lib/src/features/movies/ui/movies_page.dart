import 'package:flutter/material.dart';
import 'package:project_flca2/src/core/router/router.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/tab_bar_content/movies_content.dart';
import 'package:project_flca2/src/features/movies/ui/widgets/tab_bar_content/rentals_content.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    IconButton(
                      // style: ButtonStyle(backgroundColor: Colors.grey),
                      color: Colors.white,
                      icon: Icon(Icons.person),
                      onPressed: () => {},
                    ),
                    Text("Joao", style: TextStyle(color: Colors.white),),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () => router.go("/"),
                ),
              ],
            ),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              // Tab(icon: Icon(Icons.grid_4x4), text: "GridView"),
              Tab(text: "Available Movies"),
              Tab(text: "Movies Rental"),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MoviesContent(),
            RentalsContent(),
          ],
        ),
      ),
    );
  }
}
