import 'package:flutter/material.dart';
import 'package:movie_app/components/subtitle_container.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import '../constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/components/navigator.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({required this.index, Key? key}) : super(key: key);
  final index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 160,
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: RawMaterialButton(
            onPressed: () {
              nextPage(context, MovieDetailsPage());
            },
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: AspectRatio(
                      aspectRatio: 4 / 5,
                      child: Image.asset(
                        'assets/images/cross.jpg',
                        fit: BoxFit.cover,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('Movie Title $index',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 19)),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Catagory1, Catagory2',
                          style: GoogleFonts.inter(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SubtitleContainer(
                              child: Text('2019',
                                  style: GoogleFonts.inter(fontSize: 14))),
                          SubtitleContainer(child: Text('Age group')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SubtitleContainer(child: Text('Rating')),
                          SubtitleContainer(child: Text('Length')),
                        ],
                      ),
                    ],
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
