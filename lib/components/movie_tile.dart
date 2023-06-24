//This widget is build to display the movie poster and its details at one glance. It is just like ListTile

import 'package:flutter/material.dart';
import 'package:movie_app/components/subtitle_container.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/components/navigator.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({required this.index, required this.selectedMovie, Key? key})
      : super(key: key);
  final index;
  final Map selectedMovie;
  final String imageUrl =
      'https://image.tmdb.org/t/p/w500'; //this is the general link for all images

  //some movies have null value in poster address. This function is created for null safety so that the 'no image' warning is shown if the movie does not have it's poster address
  String getPosterUrl() {
    if (selectedMovie['poster_path'] != null) {
      String imageUrl2 = selectedMovie['poster_path'];
      String fullImageUrl = imageUrl + imageUrl2;
      return fullImageUrl;
    } else if (selectedMovie['backdrop_path'] != null) {
      String imageUrl2 = selectedMovie['backdrop_path'];
      String fullImageUrl = imageUrl + imageUrl2;
      return fullImageUrl;
    } else {
      String noImageUrl =
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPuTtKOVtKDbqZOxpb5f3-jMfRbcH6j2Owq71kzcXRsQ&s';
      return noImageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: RawMaterialButton(
          onPressed: () {
            nextPage(context, MovieDetailsPage(selectedMovie: selectedMovie));
          },
          child: SizedBox(
            height: 160,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: Image.network(getPosterUrl(), fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                              // some movies have their name contained in different key. so every possible key is checked to detect the name
                              selectedMovie['name'] ??
                                  selectedMovie['title'] ??
                                  selectedMovie['original_name'] ??
                                  selectedMovie['original_title'],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 19)),
                        ),
                        const SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            selectedMovie['first_air_date'] ??
                                selectedMovie['release_date'] ??
                                '',
                            style: GoogleFonts.inter(
                                fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SubtitleContainer(
                              child: Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 15, color: Color(0xFFFAC301)),
                                  const SizedBox(width: 5),
                                  Text(selectedMovie['vote_average'].toString(),
                                      style: GoogleFonts.poppins(fontSize: 14)),
                                ],
                              ),
                            ),
                            SubtitleContainer(
                                child: Text(selectedMovie['adult'] == false
                                    ? 'All ages'
                                    : '+18')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SubtitleContainer(
                              child: Text(
                                'Popularity : ${selectedMovie['popularity']}',
                                style: GoogleFonts.poppins(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
