//This widget creates movie catagory title with horizontal listview ot the movies

import 'package:flutter/material.dart';
import 'movie_poster_builder.dart';

class MovieCatagoryWithScroller extends StatelessWidget {
  const MovieCatagoryWithScroller({
    super.key,
    required this.catagory,
    required this.movieList,
  });

  final String catagory;
  final List movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(catagory,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          // color: Colors.red,
          // width: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) =>
                  MoviePosterBuilder(index: index, movieList: movieList)),
        ),
      ],
    );
  }
}
