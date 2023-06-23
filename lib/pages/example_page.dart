//This file is created to experiment with the code. Contents of this file is not included in the final project.

import 'package:flutter/material.dart';
import 'package:movie_app/services/networking.dart';

List result = [];
const String apiKey = 'c60834cb4b6d3b7e9d32c8ff843caff1';
const readAccessToken =
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
    result = await NetworkHepler().searchMovies(searchWord: 'Avatar');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: const Column(
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
