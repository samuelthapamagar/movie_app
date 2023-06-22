import 'package:flutter/material.dart';
import 'package:movie_app/components/subtitle_container.dart';
import 'package:movie_app/services/networking.dart';
import 'package:tmdb_api/tmdb_api.dart';

List trendingmovies = [];
final String apiKey = 'c60834cb4b6d3b7e9d32c8ff843caff1';
final readAccessToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjA4MzRjYjRiNmQzYjdlOWQzMmM4ZmY4NDNjYWZmMSIsInN1YiI6IjY0OTMzOTk0OGVlMGE5MDBhYjFkN2RhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BOSS8B1kRAqRmhpEjjIwQpLVsiDgTivQJYqL-XTn4II';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    trendingmovies = await NetworkHepler().loadTrendingMovies();
    print(trendingmovies);

    // TMDB tmdbWithCustomLogs = TMDB(
    //     ApiKeys('c60834cb4b6d3b7e9d32c8ff843caff1',
    //         'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjA4MzRjYjRiNmQzYjdlOWQzMmM4ZmY4NDNjYWZmMSIsInN1YiI6IjY0OTMzOTk0OGVlMGE5MDBhYjFkN2RhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BOSS8B1kRAqRmhpEjjIwQpLVsiDgTivQJYqL-XTn4II'),
    //     logConfig: const ConfigLogger(
    //       showLogs: true,
    //       showErrorLogs: true,
    //     ));
    // Map trendingResult = await tmdbWithCustomLogs.v3.tv.getAiringToday();
    // print(trendingResult);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
              Icon(Icons.add),
            ],
          ),
        ],
      ),
    ));
  }
}
