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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
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
