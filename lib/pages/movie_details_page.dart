import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/components/subtitle_container.dart';
import 'package:movie_app/constants.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({required this.selectedMovie, Key? key})
      : super(key: key);

  final Map selectedMovie;

  final String imageUrl =
      'https://image.tmdb.org/t/p/w500'; //this is the general link for all images

  //some movies have null value in poster address. This function is created for null safety so that the 'no image' warning is shown if the movie does not have it's poster address
  String getPosterUrl() {
    if (selectedMovie['backdrop_path'] != null) {
      String imageUrl2 = selectedMovie['backdrop_path'];
      String fullImageUrl = imageUrl + imageUrl2;
      return fullImageUrl;
    } else if (selectedMovie['poster_path'] != null) {
      String imageUrl2 = selectedMovie['poster_path'];
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
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: orientation ==
              Orientation
                  .portrait //If the device is in potrait mode then the movie poster and the detais will be at the top and the bottom respectively. If the device is in landscape mode then the movie poster and the detais will be at the left and the right side respectively.
          ? Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: Image.network(getPosterUrl(), fit: BoxFit.cover),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                // margin: EdgeInsets.all(5.0),
                                color: kSecondaryColor1.withOpacity(0.7),
                                height: 40,
                                width: 40,
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                selectedMovie['first_air_date'] ??
                                    selectedMovie['release_date'] ??
                                    '',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.lightGreen)),
                            const SizedBox(width: 10),
                            const Icon(Icons.language,
                                color: Colors.grey, size: 14),
                            const SizedBox(width: 3),
                            Text(selectedMovie['original_language'] ?? '',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 15, color: Color(0xFFFAC301)),
                            const SizedBox(width: 5),
                            Text(selectedMovie['vote_average'].toString(),
                                style: GoogleFonts.poppins(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                              selectedMovie['name'] ??
                                  selectedMovie['title'] ??
                                  selectedMovie['original_name'] ??
                                  selectedMovie['original_title'] ??
                                  '',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                        ),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: SubtitleContainer(
                              child: Text(
                                  'Popularity : ${selectedMovie['popularity'].toString()}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Overview :',
                            style: GoogleFonts.poppins(fontSize: 15)),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedMovie['overview'] ?? '',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.maxFinite,
                        child: Image.network(getPosterUrl(), fit: BoxFit.cover),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  // margin: EdgeInsets.all(5.0),
                                  color: kSecondaryColor1.withOpacity(0.7),
                                  height: 40,
                                  width: 40,
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                selectedMovie['first_air_date'] ??
                                    selectedMovie['release_date'] ??
                                    '',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.lightGreen)),
                            const SizedBox(width: 10),
                            const Icon(Icons.language,
                                color: Colors.grey, size: 14),
                            const SizedBox(width: 3),
                            Text(selectedMovie['original_language'] ?? '',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                size: 15, color: Color(0xFFFAC301)),
                            const SizedBox(width: 5),
                            Text(selectedMovie['vote_average'].toString(),
                                style: GoogleFonts.poppins(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: Text(
                              selectedMovie['name'] ??
                                  selectedMovie['title'] ??
                                  selectedMovie['original_name'] ??
                                  selectedMovie['original_title'] ??
                                  '',
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                        ),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: SubtitleContainer(
                              child: Text(
                                  'Popularity : ${selectedMovie['popularity'].toString()}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Overview :',
                            style: GoogleFonts.poppins(fontSize: 15)),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedMovie['overview'] ?? '',
                                    style: GoogleFonts.poppins(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    ));
  }
}
