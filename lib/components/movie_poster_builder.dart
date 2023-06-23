import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/services/networking.dart';
import '../pages/movie_details_page.dart';
import 'navigator.dart';

class MoviePosterBuilder extends StatelessWidget {
  MoviePosterBuilder({
    required this.index,
    required this.movieList,
    super.key,
  });

  final index;
  final movieList;
  final String imageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
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
                    image: FastCachedImageProvider(
                      imageUrl + movieList[index]['poster_path'],
                    ),
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
                    movieList[index]['name'] ??
                        movieList[index]['title'] ??
                        movieList[index]['original_name'] ??
                        movieList[index]['original_title'],
                    style: GoogleFonts.poppins(),
                    overflow: TextOverflow.ellipsis))),
      ],
    );
  }
}
