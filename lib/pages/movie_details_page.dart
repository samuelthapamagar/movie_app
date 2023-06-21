import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/components/subtitle_container.dart';
import 'package:movie_app/constants.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 250,
                  width: double.maxFinite,
                  child: Image.asset('assets/images/parrot.jpg',
                      fit: BoxFit.cover)),
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
                          child: Icon(
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
                      Text('Release Year',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.lightGreen)),
                      SizedBox(width: 10),
                      Text('02:05:30',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 15, color: Color(0xFFFAC301)),
                      SizedBox(width: 5),
                      Text('Rating', style: GoogleFonts.poppins(fontSize: 14)),
                    ],
                  ),
                  const Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: SubtitleContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.play_arrow, size: 20),
                            SizedBox(width: 5),
                            Text('Play')
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text('Movie Title',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              SubtitleContainer(
                                  child: Text('Catagory 1',
                                      style: GoogleFonts.poppins(fontSize: 10)))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              SubtitleContainer(
                                  child: Text('Catagory 2',
                                      style: GoogleFonts.poppins(fontSize: 10)))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              SubtitleContainer(
                                  child: Text('Catagory 3',
                                      style: GoogleFonts.poppins(fontSize: 10)))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'This section is for movie details. Im having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put SpacerIm having the same problem but i dont want to use SizedBox since i want to position the widget at the end of the screen and using sizedBox seems quite iresponsive. I send the code in paste bin and commented where im trying to put Spacer',
                            style: GoogleFonts.poppins(),
                          ),
                        ],
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
