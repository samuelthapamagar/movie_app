//This widget is for building the poster of a movie

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/movie_details_page.dart';
import 'navigator.dart';

class MoviePosterBuilder extends StatelessWidget {
  const MoviePosterBuilder({
    required this.index,
    required this.movieList,
    super.key,
  });

  final int index;
  final List movieList;
  final String imageUrl =
      'https://image.tmdb.org/t/p/w500'; // This is the general link for all images

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 3.0),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  child: Ink.image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        imageUrl + movieList[index]['poster_path']),
                    child: InkWell(onTap: () {
                      nextPage(context,
                          MovieDetailsPage(selectedMovie: movieList[index]));
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            width: 120,
            child: Center(
                child: Text(
                    // some movies have their name contained in different key. so every possible key is checked to detect the name
                    movieList[index]['name'] ??
                        movieList[index]['title'] ??
                        movieList[index]['original_name'] ??
                        movieList[index]['original_title'] ??
                        'Loading...',
                    style: GoogleFonts.poppins(),
                    overflow: TextOverflow.ellipsis))),
      ],
    );
  }
}
