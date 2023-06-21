import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/movie_details_page.dart';
import 'navigator.dart';

class MoviePosterBuilder extends StatelessWidget {
  const MoviePosterBuilder({
    required this.index,
    super.key,
  });
  final index;
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
                    image: AssetImage(
                      'assets/images/parrot.jpg',
                    ),
                    child: InkWell(
                      onTap: () {
                        nextPage(context, MovieDetailsPage());
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
            width: 120,
            child:
                Center(child: Text('Movie name', overflow: TextOverflow.clip))),
      ],
    );
  }
}
