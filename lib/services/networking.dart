import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class NetworkHepler {
  final String apiKey = 'c60834cb4b6d3b7e9d32c8ff843caff1';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjA4MzRjYjRiNmQzYjdlOWQzMmM4ZmY4NDNjYWZmMSIsInN1YiI6IjY0OTMzOTk0OGVlMGE5MDBhYjFkN2RhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BOSS8B1kRAqRmhpEjjIwQpLVsiDgTivQJYqL-XTn4II';

  loadTrendingMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map response = await tmdbWithCustomLogs.v3.trending.getTrending();
    return response['results'];

    // Map response = await tmdbWithCustomLogs.v3.trending.getTrending();
    // return response['results'];
  }

  loadSeries() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map response = await tmdbWithCustomLogs.v3.tv.getAiringToday();
    return response['results'];
  }

  loadTopRated() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map response = await tmdbWithCustomLogs.v3.movies.getTopRated();
    return response['results'];
  }

  loadUpcoming() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map response = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    return response['results'];
  }

  loadNowPlaying() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map response = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    return response['results'];
  }
}
